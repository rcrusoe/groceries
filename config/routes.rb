Rails.application.routes.draw do
  get "/auth/oauth2/callback" => "auth0#callback"
  get "/auth/failure" => "auth0#failure"
  get "/auth/logout" => "auth0#logout"
  get "/auth/login" => "auth0#login"
  get "/groceries" => "grocery_lists#show"
  get "/recipes/search" => "recipes#search"
  get "/search", to: redirect('/recipes/search')
  get "/my-recipes/cooked" => "recipes#cooked"
  get "/my-recipes/favorites" => "recipes#favorites"

  resources :recipe_sources, path: :sources do
    resources :recipes
  end

  resources :recipes do
    resources :meal_plans
    resources :likes

    member do
      get "/unlike", to: "recipes#unlike"
      get "/like", to: "recipes#like"
      get '/add-to-list', to: "recipes#add_to_list"
      get '/remove-from-list', to: "recipes#remove_from_list"
    end
  end

  resources :meal_plans do
    member do
      get "archive", to: "meal_plans#archive"
    end
  end
  root :to => "recipes#index"
end
