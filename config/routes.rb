Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "pages#index"
  get "index", to: "pages#index"
  get "show", to: "pages#show"
  get "destroy", to: "pages#destroy"
  get "update", to: "pages#update"

  get "folders", to: "slacks#folders"
end
