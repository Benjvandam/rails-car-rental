Rails.application.routes.draw do
  devise_for :users
  root to: "cars#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :cars do
    resources :bookings, only: %i[index edit update create]
    resources :reviews, only: %i[index create]
  end

  resources :bookings, only: %i[destroy]


  # Defines the root path route ("/")
  # root "articles#index"
end
