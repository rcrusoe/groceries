Rails.application.routes.draw do
  resources :recipe_sources
  get "/auth/oauth2/callback" => "auth0#callback"
  get "/auth/failure" => "auth0#failure"
  get "/auth/logout" => "auth0#logout"
  get "/auth/login" => "auth0#login"
  get "/groceries" => "grocery_lists#show"

  resources :recipes do
    resources :meal_plans
    resources :likes
  end

  resources :likes

  resources :meal_plans do
    member do
      get "archive", to: "meal_plans#archive"
    end
  end
  root :to => "recipes#index"
end
