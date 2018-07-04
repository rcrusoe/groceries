class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Auth0Helper
  include GroceryListsHelper
  include RecipesHelper

  before_action :ingredient_count, :popular_sources

  def ingredient_count
    if current_user
      grocery_items_on_list
      @ingredient_count = @ingreds.count
    end
  end

  def is_admin?
    redirect_to root_path unless current_user && current_user["uid"] = "google-oauth2|111539100317559359673"
  end

  def store_location
    session[:user_return_to] = request.fullpath
  end

  def likes
    if current_user
      @likes = Recipe.joins(:likes).where(likes: {user_id: current_user["uid"]})
    end
  end

  def popular_sources
    @most_popular_sources = RecipeSource.joins(recipes: :likes)
      .group('recipe_sources.id')
      .order('count(likes.id) DESC')
      .limit(5)
  end

  def popular_recipes
    @most_popular_recipes = Recipe.joins(:likes)
      .group('recipes.id')
      .order('count(likes.id) DESC')
      .limit(5)
  end
end
