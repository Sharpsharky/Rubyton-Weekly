Rails.application.routes.draw do
  devise_for :users

  resources :hackathons, only: [:index, :create, :show]
  root 'entries#index'
  resources :entries
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
