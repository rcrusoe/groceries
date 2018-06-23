class GroceryListsController < ApplicationController
  after_action :store_location, only: [:show]

  def show
    ingredient_count
    grocery_items_on_list
  end
end
