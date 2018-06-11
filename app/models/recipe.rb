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
    require 'mechanize'
    require 'open-uri'

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

    self.ingredients = []
    self.name = @doc.css(@recipe_source.scrape_name).first.text
    unless @recipe_source.scrape_image.blank?
      unless @doc.css(@recipe_source.scrape_image).blank?
        if @doc.css(@recipe_source.scrape_image).first.attr('src')
          i = @doc.css(@recipe_source.scrape_image).first.attr('src')
          self.image_url = Base64.strict_encode64 agent.get(i).body_io.string
        elsif @doc.css(@recipe_source.scrape_image).first.attr('srcset')
          i = @doc.css(@recipe_source.scrape_image).first.attr('srcset')
          i = i.split('.jpg')
          i = i[0] + '.jpg'
          self.image_url = Base64.strict_encode64 agent.get(i).body_io.string
        end
      end
    end
    ingredients = @doc.css(@recipe_source.scrape_ingredient)
    ingredients.each do |ingredient|
      self.ingredients << ingredient.text
    end
  end
end
