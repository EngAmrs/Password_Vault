Rails.application.routes.draw do

  #login
  root to: "sessions#new"
  resources :sessions, only: [:new, :create]
  get '/logout', to: 'sessions#logout', as: :logout


  #Register
  resources :users, only: [:new, :create]
  get "/registration_success", to: "users#success"

  #services
  resources :services
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
