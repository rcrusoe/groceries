class GroceryListsController < ApplicationController
  def show
    ingredient_count
    grocery_items_on_list
  end
end
