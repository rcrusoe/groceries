class Recipe < ApplicationRecord
  before_save :get_recipe_details

  def get_recipe_details
    require 'open-uri'
    doc = Nokogiri::HTML(open(self.link))
    self.name = doc.css('h1.entry-title').text
    self.ingredients = []
    ingredients = doc.css('.ingredient')
    ingredients.each do |ingredient|
      self.ingredients << ingredient.text
    end
  end
end
