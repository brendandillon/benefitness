Rails.application.routes.draw do
  root to: 'home#show'
  get '/account', to: 'account#show'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:create]

  namespace :admin do
    resources :teams, only: [:new, :create, :show]
  end

end
