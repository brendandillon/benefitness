Rails.application.routes.draw do
  root to: 'home#show'
  get '/account', to: 'account#show'
  put '/account', to: 'account#edit'
  get '/fitbit/callback', to: 'fitbit#sync'

  resources :users, only: [:new, :create, :update]
  resources :sessions, only: [:create, :destroy]
  resources :workouts, only: [:index, :new, :create]

  namespace :admin do
    resources :teams, only: [:new, :create, :show]
  end

end
