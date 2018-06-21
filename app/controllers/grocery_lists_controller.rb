class GroceryListsController < ApplicationController
  def show
    current_recipes_on_list
    ingredient_count
    grocery_items_on_list
  end
end
