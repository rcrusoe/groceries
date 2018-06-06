class Recipe < ApplicationRecord
  before_save :scrape_recipe
  belongs_to :recipe_source
  has_many :meal_plans, :dependent => :destroy
  has_many :likes, :dependent => :destroy
  accepts_nested_attributes_for :meal_plans

  def scrape_recipe
    require 'open-uri'
    @doc = Nokogiri::HTML(open(self.link, 'User-Agent' => 'firefox'))
    @recipe_source = RecipeSource.where(slug: self.link.split('.').second).first

    self.ingredients = []
    self.name = @doc.css(@recipe_source.scrape_name).text
    unless @recipe_source.scrape_image.blank?
      self.image_url = @doc.css(@recipe_source.scrape_image).first.attr('src')
    end
    ingredients = @doc.css(@recipe_source.scrape_ingredient)
    ingredients.each do |ingredient|
      self.ingredients << ingredient.text
    end
  end
end
