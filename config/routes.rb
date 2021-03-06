Rails.application.routes.draw do
  root "welcome#index"

  get '/auth/:provider/callback', to: 'sessions#create'

  get '/dashboard', to: 'dashboard#index'

  post '/friends', to: 'friends#create'

  resources :discover, only: :index
  resources :movies, only: [:show, :index]
  resources :viewing_party, only: [:new, :create]
end
