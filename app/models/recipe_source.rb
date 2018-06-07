class RecipeSource < ApplicationRecord
  has_many :recipes, :dependent => :destroy
  accepts_nested_attributes_for :recipes
  before_save :set_slug

  def set_slug
    s = URI.parse(link)
    slug_segments = s.host.split('.')
    if slug_segments.count > 2
      self.slug = slug_segments[1] + "." + slug_segments[2]
    else
      self.slug = s.host
    end
  end
end
