class GroceryItem < ApplicationRecord
  has_many :ingredients
  has_many :recipes, through: :ingredients
end
