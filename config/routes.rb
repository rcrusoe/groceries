Rails.application.routes.draw do
  resources :recipes
  root :to => "recipes#new"
end
