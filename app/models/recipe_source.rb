class RecipeSource < ApplicationRecord
  has_many :recipes, :dependent => :destroy
  accepts_nested_attributes_for :recipes
  before_save :set_slug

  def set_slug
    s = URI.parse(link)
    self.slug = s.host
  end
end
