Rails.application.routes.draw do
  root "welcome#index"

  get 'auth/:provider/callback', to: 'sessions#create'

  get '/dashboard', to: 'dashboard#index'

<<<<<<< HEAD
  post '/friends', to: 'friends#create'
=======
  resources :discover, only: :index
  resources :movies, only: [:show, :index]
>>>>>>> d280ebd780d8f4f08b2f3e90e472bf115a14bf91
end
