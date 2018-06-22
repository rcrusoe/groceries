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
end
