Rails.application.routes.draw do

  root to: "home#index"

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete    'logout', to: 'sessions#destroy'

  resources :gifs, only: [:index]

  resources :users, only: [:new, :create, :show]
end
