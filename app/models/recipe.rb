class Recipe < ApplicationRecord
  before_save :identify_source

  def identify_source
    require 'open-uri'
    @doc = Nokogiri::HTML(open(self.link, 'User-Agent' => 'firefox'))

    case
    when link.include?("minimalistbaker.com")
      self.get_recipe_details(
        'h1.entry-title',
        '.entry-content img',
        '.ingredient'
      )
    when link.include?("halfbakedharvest.com")
      self.get_recipe_details(
        'h1.post-title',
        '.post-content img',
        '.wprm-recipe-ingredient'
      )
    when link.include?("smittenkitchen.com")
      self.get_recipe_details(
        'h1.entry-title > a',
        '.post-thumbnail-container > img',
        '.jetpack-recipe-ingredient'
      )
    end
  end

  def get_recipe_details(name, image, ingredient)
    self.ingredients = []
    self.name = @doc.css(name).text
    self.image_url = @doc.css(image).first.attr('src')
    ingredients = @doc.css(ingredient)
    ingredients.each do |ingredient|
      self.ingredients << ingredient.text
    end
  end
end
