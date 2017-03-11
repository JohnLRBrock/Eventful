Rails.application.routes.draw do
  root 'events#index'
  get '/login',                     to: 'users#new'
  get '/logout',                    to: 'users#logout'
  get '/invite/:event_id/:user_id', to: 'events#invite', as: 'invite'
  get '/attend/:event_id/:user_id', to: 'events#attend', as: 'attend'
  resources :users, only: [:new, :create, :show]
  resources :events, only: [:new, :create, :index, :show]
end
