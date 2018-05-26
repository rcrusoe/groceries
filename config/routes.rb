Rails.application.routes.draw do
  get "/auth/oauth2/callback" => "auth0#callback"
  get "/auth/failure" => "auth0#failure"
  get "/auth/logout" => "auth0#logout"

  resources :recipes
  root :to => "recipes#index"
end
