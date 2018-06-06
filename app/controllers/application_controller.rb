class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Auth0Helper
  include GroceryListsHelper
  include RecipesHelper

  before_action :ingredient_count

  def ingredient_count
    if current_user
      current_recipes_on_list
      @ingredient_count = 0
      @meal_plans.each do |meal_plan|
        @ingredient_count += meal_plan.recipe.ingredients.count
      end
    end
  end
end
