Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'pages#repositories'
  get "repositories", to: "pages#repositories"
  get "repository", to: "pages#repository"
  get "remove", to: "pages#remove"
  get "add", to: "pages#add"
end
