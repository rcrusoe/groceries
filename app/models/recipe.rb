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
    when link.include?("allrecipes.com")
      self.get_recipe_details(
        '.recipe-summary__h1',
        '.rec-photo',
        '.recipe-ingred_txt'
      )
    when link.include?("epicurious.com/recipes")
      self.get_recipe_details(
        'h1',
        'picture',
        '.ingredient-item'
      )
    when link.include?("delish.com/cooking/recipe-ideas")
      self.get_recipe_details(
        'h1.content-hed.recipe-hed',
        'img',
        '.ingredient-item'
      )
    when link.include?("myrecipes.com/recipe")
      self.get_recipe_details(
        'h1.headline',
        nil,
        '.ingredients li'
      )
    when link.include?("geniuskitchen.com/recipe")
      self.get_recipe_details(
        '.recipe-header h1',
        nil,
        '.ingredient-list li'
      )
    when link.include?("tasty.co/recipe")
      self.get_recipe_details(
        'h1.recipe-name',
        nil,
        '.ingredients__section li'
      )
    when link.include?("thepioneerwoman.com/cooking")
      self.get_recipe_details(
        'h2.entry-title',
        '.featured-image img',
        '.list-ingredients li'
      )
    end
  end

  def get_recipe_details(name, image, ingredient)
    self.ingredients = []
    self.name = @doc.css(name).text
    if image
      self.image_url = @doc.css(image).first.attr('src')
    end
    ingredients = @doc.css(ingredient)
    ingredients.each do |ingredient|
      self.ingredients << ingredient.text
    end
  end
end
