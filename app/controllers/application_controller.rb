class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Auth0Helper
  include GroceryListsHelper
  include RecipesHelper

  before_action :ingredient_count

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
end
