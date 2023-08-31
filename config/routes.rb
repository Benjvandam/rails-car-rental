Rails.application.routes.draw do
  devise_for :users
  root to: "cars#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :cars do
    resources :bookings, only: %i[index create]
    resources :reviews, only: %i[index new create]
  end

  resources :bookings, only: %i[index destroy edit update]

  resources :chatrooms, only: %i[index create show] do
    resources :messages, only: :create
  end

  resources :users, only: %i[show]

  get 'garage', to: "users#myCars"

  # Defines the root path route ("/")
  # root "articles#index"
end
