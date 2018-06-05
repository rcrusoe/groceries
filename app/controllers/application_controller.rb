class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Auth0Helper
  include GroceryListsHelper
  include RecipesHelper
end
