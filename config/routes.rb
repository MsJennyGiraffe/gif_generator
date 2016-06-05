Rails.application.routes.draw do
  root to: "home#index"

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete    'logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show]

  namespace :admin do
    resources :categories, only: [:new, :create]
  end

  resources :gifs, only: [:index]

  resources :categories, only: [:show, :index]
end
