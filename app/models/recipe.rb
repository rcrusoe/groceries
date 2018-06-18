class Recipe < ApplicationRecord
  before_save :scrape_recipe
  belongs_to :recipe_source
  has_many :meal_plans, :dependent => :destroy
  has_many :likes, :dependent => :destroy
  accepts_nested_attributes_for :meal_plans
  accepts_nested_attributes_for :likes
  validates_length_of :ingredients, minimum: 1, if: :scrape_recipe
  validates_presence_of :name, if: :scrape_recipe

  extend FriendlyId
  friendly_id :name, use: :slugged

  def scrape_recipe
    require 'open-uri'
    require 'mechanize'
    require 'aws-sdk-s3'

    agent = Mechanize.new

    @doc = Nokogiri::HTML(open(self.link, 'User-Agent' => 'firefox'))
    s = URI.parse(self.link)
    domain_segments = s.host.split('.')
    if domain_segments.count > 2
      domain = domain_segments[1] + "." + domain_segments[2]
    else
      domain = s.host
    end
    @recipe_source = RecipeSource.where(domain: domain).first

    if @doc.css(@recipe_source.scrape_name).first
      self.name = @doc.css(@recipe_source.scrape_name).first.text
    end

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

    self.ingredients = []
    ingredients = @doc.css(@recipe_source.scrape_ingredient)
    ingredients.each do |ingredient|
      self.ingredients << ingredient.text
    end
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
