class Recipe < ApplicationRecord
  before_save :identify_source
  has_many :meal_plans, :dependent => :destroy
  accepts_nested_attributes_for :meal_plans

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
    when link.include?("thekitchn.com")
      self.get_recipe_details(
        'h1.PostHeader__headline',
        '.PostPicture__picture img',
        '.PostRecipeIngredientGroup__ingredient'
      )
    when link.include?("foodnetwork.com/recipes")
      self.get_recipe_details(
        'h1.o-AssetTitle__a-Headline',
        nil,
        '.o-Ingredients__a-ListItemText'
      )
    when link.include?("food52.com/recipes")
      self.get_recipe_details(
        'h1.article-header-title',
        '#recipe-gallery-frame img',
        '.recipe-list li'
      )
    when link.include?("yummly.com/recipe")
      self.get_recipe_details(
        '.primary-info-text h1',
        nil,
        '.IngredientLine'
      )
    when link.include?("chowhound.com/recipes")
      self.get_recipe_details(
        'h1',
        nil,
        'li[itemprop="ingredients"]'
      )
    when link.include?("simplyrecipes.com/recipes")
      self.get_recipe_details(
        'h1.entry-title',
        '.featured-image img',
        'li.ingredient'
      )
    when link.include?("cookinglight.com/recipes")
      self.get_recipe_details(
        'h1.headline',
        '.image-container img',
        '.ingredients li'
      )
    when link.include?("bettycrocker.com/recipes")
      self.get_recipe_details(
        '.recipePartTitle h1',
        '.recipePartRecipeImage img',
        '.recipePartIngredient'
      )
    when link.include?("myrecipes.com/recipe")
      self.get_recipe_details(
        'h1.headline',
        '.image-container img',
        '.ingredients li'
      )
    when link.include?("eatingwell.com/recipe")
      self.get_recipe_details(
        '.recipeDetailSummaryDetails h3.recipeDetailHeader',
        'img.recipeDetailSummaryImageMain',
        'span[itemprop="ingredients"]'
      )
    when link.include?("cooks.com/recipe")
      self.get_recipe_details(
        '.title',
        nil,
        '.ingredient'
      )
    when link.include?("kraftrecipes.com/recipes")
      self.get_recipe_details(
        'h1#khMainTitle',
        nil,
        'span[itemprop="recipeIngredient"]'
      )
    when link.include?("seriouseats.com/recipes")
      self.get_recipe_details(
        'h1.recipe-title',
        '.recipe-main-photo img',
        '.ingredient'
      )
    when link.include?("lowcarbyum.com")
      self.get_recipe_details(
        '.entry-header h1.entry-title',
        '.entry-content img',
        '.wprm-recipe-ingredient'
      )
    when link.include?("ifoodreal.com")
      self.get_recipe_details(
        'h1.entry-title',
        '.entry-content img',
        '.ifoodreal-recipe-ingredients li'
      )
    when link.include?("ambitiouskitchen.com")
      self.get_recipe_details(
        'h1.entry-title',
        '.entry_content p img',
        '.ERSIngredients li'
      )
    when link.include?("dinneratthezoo.com")
      self.get_recipe_details(
        'h1.entry-title',
        '.entry-content p img',
        '.wprm-recipe-ingredient'
      )
    when link.include?("damndelicious.net")
      self.get_recipe_details(
        '.post-title h1',
        '.post p img',
        '.ingredient'
      )
    when link.include?("thegirlonbloor.com")
      self.get_recipe_details(
        'h1.entry-title',
        '.entry-content p img',
        '.wpurp-responsive-desktop .wpurp-recipe-ingredient-container .wpurp-recipe-ingredient'
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
