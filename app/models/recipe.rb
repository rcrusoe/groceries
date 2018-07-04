class Recipe < ApplicationRecord
  before_save :scrape_recipe
  after_save :save_ingredients

  belongs_to :recipe_source
  has_many :meal_plans, :dependent => :destroy
  has_many :likes, :dependent => :destroy
  has_many :ingredients, :dependent => :destroy
  has_many :grocery_items, through: :ingredients

  accepts_nested_attributes_for :meal_plans
  accepts_nested_attributes_for :likes
  accepts_nested_attributes_for :ingredients
  validates_length_of :ingredients_array, minimum: 1, if: :scrape_recipe
  validates_presence_of :name, if: :scrape_recipe

  paginates_per 20

  extend FriendlyId
  friendly_id :name, use: :slugged

  def scrape_recipe
    require 'open-uri'
    require 'mechanize'
    require 'aws-sdk-s3'
    agent = Mechanize.new
    identify_recipe_source

    unless @recipe_source.blank?
      save_recipe_name
      scrape_ingredient_array
      unless @recipe_source.scrape_image.blank?
        unless @doc.css(@recipe_source.scrape_image).blank?
          if @doc.css(@recipe_source.scrape_image).first.attr('src')
            i = @doc.css(@recipe_source.scrape_image).first.attr('src')
            save_image_to_s3(i, agent)
          elsif @doc.css(@recipe_source.scrape_image).first.attr('srcset')
            i = @doc.css(@recipe_source.scrape_image).first.attr('srcset')
            i = i.split('.jpg')
            i = i[0] + '.jpg'
            save_image_to_s3(i, agent)
          end
        end
      end
    else
      false
    end
  end

  def identify_recipe_source
    @doc = Nokogiri::HTML(open(self.link, 'User-Agent' => 'firefox'))
    s = URI.parse(self.link)
    domain_segments = s.host.split('.')
    if domain_segments.count > 2
      domain = domain_segments[1] + "." + domain_segments[2]
    else
      domain = s.host
    end
    @recipe_source = RecipeSource.where(domain: domain).first
  end

  def save_recipe_name
    if @doc.css(@recipe_source.scrape_name).first
      self.name = @doc.css(@recipe_source.scrape_name).first.text.downcase
    end
  end

  def scrape_ingredient_array
    self.ingredients_array = []
    ingredients = @doc.css(@recipe_source.scrape_ingredient)
    ingredients.each do |ingredient|
      self.ingredients_array << ingredient.text
    end
  end

  def save_ingredients
    @doc = Nokogiri::HTML(open(self.link, 'User-Agent' => 'firefox'))
    ingredients = @doc.css(@recipe_source.scrape_ingredient)
    ingredients.each do |ingredient|
      self.ingredients_array << ingredient.text.downcase
      grocery_item_name = set_grocery_item(ingredient.text)
      unless grocery_item_name.blank?
        grocery_item = GroceryItem.where(name: grocery_item_name).first_or_create(name: grocery_item_name)
      else
        grocery_item = GroceryItem.where(name: "Unidentified").first_or_create(name: "Unidentified")
      end
      ing = Ingredient.where(recipe_id: self.id, note: ingredient.text).first_or_create(recipe_id: self.id, grocery_item_id: grocery_item.id, note: ingredient.text)
    end
  end

  def set_grocery_item(string)
    require "google/cloud/language"
    language = Google::Cloud::Language.new
    response = language.analyze_entities content: string, type: :PLAIN_TEXT
    entities = response.entities
    blacklist = ["cup", "teaspoon", "pinch", "tablespoon"]
    unless entities.blank?
      entities.each do |e|
        return e.name unless blacklist.include?(e.name.downcase)
      end
    end
    return nil
  end

  def save_image_to_s3(i, agent)
    slug = self.name.parameterize
    agent.get(i).save "tmp/cache/assets/images/#{slug}.jpg"
    s3 = Aws::S3::Resource.new(region:'us-east-1')
    obj_key = "recipes/#{@recipe_source.slug}/#{slug}"
    obj = s3.bucket('recidex').object(obj_key)
    obj.upload_file("tmp/cache/assets/images/#{slug}.jpg")
    bucket = s3.bucket("recidex")
    object = bucket.object(obj_key)
    resp = object.acl.put({ acl: "public-read" })
    self.image_url = "https://s3.amazonaws.com/recidex/#{obj_key}"
  end
end
