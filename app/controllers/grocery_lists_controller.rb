class GroceryListsController < ApplicationController
  def show
    current_recipes_on_list
    ingredient_count
  end
end
