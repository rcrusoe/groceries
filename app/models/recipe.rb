class Recipe < ApplicationRecord
  before_save :scrape_recipe
  belongs_to :recipe_source
  has_many :meal_plans, :dependent => :destroy
  has_many :likes, :dependent => :destroy
  accepts_nested_attributes_for :meal_plans
  accepts_nested_attributes_for :likes
  validates_length_of :ingredients, minimum: 1, if: :scrape_recipe

  def scrape_recipe
    require 'open-uri'
    @doc = Nokogiri::HTML(open(self.link, 'User-Agent' => 'firefox'))
    s = URI.parse(self.link)
    slug_segments = s.host.split('.')
    if slug_segments.count > 2
      slug = slug_segments[1] + "." + slug_segments[2]
    else
      slug = s.host
    end
    @recipe_source = RecipeSource.where(slug: slug).first

    self.ingredients = []
    self.name = @doc.css(@recipe_source.scrape_name).text
    unless @recipe_source.scrape_image.blank?
      if @doc.css(@recipe_source.scrape_image).first.attr('src')
        self.image_url = @doc.css(@recipe_source.scrape_image).first.attr('src')
      elsif @doc.css(@recipe_source.scrape_image).first.attr('srcset')
        i = @doc.css(@recipe_source.scrape_image).first.attr('srcset')
        i = i.split('.jpg')
        i = i[0] + '.jpg'
        self.image_url = i
      end
    end
    ingredients = @doc.css(@recipe_source.scrape_ingredient)
    ingredients.each do |ingredient|
      self.ingredients << ingredient.text
    end
  end
end
