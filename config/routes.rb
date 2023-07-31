Rails.application.routes.draw do
  # Define the routes for KittensController
  resources :kittens

  # Set the default route to KittensController#index
  root to: 'kittens#index'
end
