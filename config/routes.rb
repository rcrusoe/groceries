Rails.application.routes.draw do
  get "/auth/oauth2/callback" => "auth0#callback"
  get "/auth/failure" => "auth0#failure"
  get "/auth/logout" => "auth0#logout"
  get "/auth/login" => "auth0#login"
  get "/groceries" => "grocery_lists#show"

  resources :recipe_sources, path: :sources do
    resources :recipes
  end

  resources :recipes do
    resources :meal_plans
    resources :likes
  end

  resources :likes do
    member do
      get "/unlike", to: "likes#destroy"
    end
  end

  resources :meal_plans do
    member do
      get "archive", to: "meal_plans#archive"
    end
  end
  root :to => "recipes#index"
end
