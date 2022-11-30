Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "pages#index"
  get "index", to: "pages#index"
  get "show", to: "pages#show"
  get "destroy", to: "pages#destroy"
  get "update", to: "pages#update"

  get "channels", to: "slacks#channels"

  get "connection", to: "legifrances#connection"
  get "/dashboard", to: "pages#dashboard"

  namespace :strava do
    resource :oauth, only: [] do
      collection do
        patch :connect
      end
    end

    resource :oauth_redirect, only: [] do
      collection do
        get :complete_connection
      end
    end
  end
end
