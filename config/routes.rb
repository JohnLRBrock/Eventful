Rails.application.routes.draw do
  root 'events#index'
  get '/login',  to: 'users#new'
  get '/logout', to: 'users#logout'
  resources :users, only: [:new, :create, :show]
  resources :events, only: [:new, :create, :index, :show]
end
