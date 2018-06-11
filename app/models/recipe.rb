class Recipe < ApplicationRecord
  before_save :scrape_recipe
  belongs_to :recipe_source
  has_many :meal_plans, :dependent => :destroy
  has_many :likes, :dependent => :destroy
  accepts_nested_attributes_for :meal_plans
  accepts_nested_attributes_for :likes
  validates_length_of :ingredients, minimum: 1, if: :scrape_recipe
  validates_presence_of :image_url, if: :scrape_recipe
  validates_presence_of :name, if: :scrape_recipe

  extend FriendlyId
  friendly_id :name, use: :slugged

  def scrape_recipe
    require 'base64'
    require 'open-uri'
<<<<<<< HEAD
=======
    require 'mechanize'

    agent = Mechanize.new
>>>>>>> encoding-images

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
          i_slug = i.split('/').last
          agent.get(i).save "tmp/cache/assets/images/#{i_slug}.jpg"
          i = open("tmp/cache/assets/images/#{i_slug}.jpg")
          self.image_url = Base64.strict_encode64(i.read)
        elsif @doc.css(@recipe_source.scrape_image).first.attr('srcset')
          i = @doc.css(@recipe_source.scrape_image).first.attr('srcset')
          i = i.split('.jpg')
          i = i[0] + '.jpg'
          i_slug = i.split('/').last
          agent.get(i).save "tmp/cache/assets/images/#{i_slug}.jpg"
          i = open("tmp/cache/assets/images/#{i_slug}.jpg")
          self.image_url = Base64.strict_encode64(i.read)
        end
      end
    end

    self.ingredients = []
    ingredients = @doc.css(@recipe_source.scrape_ingredient)
    ingredients.each do |ingredient|
      self.ingredients << ingredient.text
    end
  end
end
