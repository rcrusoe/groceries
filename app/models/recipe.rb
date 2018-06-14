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
    require 'open-uri'
    require 'mechanize'
    require "google/cloud/storage"

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
          self.image_url = i
          storage = Google::Cloud::Storage.new project: "recidex-207202"
          bucket = storage.bucket "recidex.com"
          i_slug = i.split('/').last
          agent.get(i).save "tmp/cache/assets/images/#{i_slug}.jpg"
          file = bucket.create_file "tmp/cache/assets/images/#{i_slug}.jpg", "recipe_images/#{@recipe_source.slug}/#{i_slug}.jpg"
          self.image_url = file.public_url
        elsif @doc.css(@recipe_source.scrape_image).first.attr('srcset')
          i = @doc.css(@recipe_source.scrape_image).first.attr('srcset')
          i = i.split('.jpg')
          i = i[0] + '.jpg'
          storage = Google::Cloud::Storage.new project: "recidex-207202"
          bucket = storage.bucket "recidex.com"
          i_slug = i.split('/').last
          agent.get(i).save "tmp/cache/assets/images/#{i_slug}.jpg"
          file = bucket.create_file "tmp/cache/assets/images/#{i_slug}.jpg", "recipe_images/#{@recipe_source.slug}/#{i_slug}.jpg"
          self.image_url = file.public_url
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
