class Recipe < ApplicationRecord
  before_save :get_recipe_details

  def get_recipe_details
    require 'open-uri'
    @doc = Nokogiri::HTML(open(self.link, 'User-Agent' => 'firefox'))

    case
    when link.include?("minimalistbaker.com")
      self.minimalist_baker
    when link.include?("halfbakedharvest.com")
      self.half_baked_harvest
    when link.include?("smittenkitchen.com")
      self.smitten_kitchen
    end
  end

  def minimalist_baker
    self.ingredients = []
    self.name = @doc.css('h1.entry-title').text
    self.image_url = @doc.css('.entry-content img').first.attr('src')
    ingredients = @doc.css('.ingredient')
    ingredients.each do |ingredient|
      self.ingredients << ingredient.text
    end
  end

  def half_baked_harvest
    self.ingredients = []
    self.name = @doc.css('h1.post-title').text
    self.image_url = @doc.css('.post-content img').first.attr('src')
    ingredients = @doc.css('.wprm-recipe-ingredient')
    ingredients.each do |ingredient|
      self.ingredients << ingredient.text
    end
  end

  def smitten_kitchen
    self.ingredients = []
    self.name = @doc.css('h1.entry-title > a').text
    self.image_url = @doc.css('.post-thumbnail-container > img').attr('src')
    ingredients = @doc.css('.jetpack-recipe-ingredient')
    ingredients.each do |ingredient|
      self.ingredients << ingredient.text
    end
  end
end
