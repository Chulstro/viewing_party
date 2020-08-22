Rails.application.routes.draw do
  root "welcome#index"

  get 'auth/:provider/callback', to: 'sessions#create'

  get '/dashboard', to: 'dashboard#index'

  resources :discover, only: :index
end
