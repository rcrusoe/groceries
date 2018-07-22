class RecipeSource < ApplicationRecord
  has_many :recipes, :dependent => :destroy
  accepts_nested_attributes_for :recipes
  before_save :set_domain

  extend FriendlyId
  friendly_id :name, use: :slugged

  def set_domain
    s = URI.parse(link)
    domain_segments = s.host.split('.')
    if domain_segments.count > 2
      self.domain = domain_segments[1] + "." + domain_segments[2]
    else
      self.domain = s.host
    end
  end

  def like_count
    Like.where('recipe_id IN (?)', self.recipes.select { |r| r.id }).count
  end
end
