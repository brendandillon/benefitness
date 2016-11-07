Rails.application.routes.draw do
  root to: 'home#show'
  get '/account', to: 'account#show'
  put '/account', to: 'account#edit'

  resources :users, only: [:new, :create, :update]
  resources :sessions, only: [:create]

  namespace :admin do
    resources :teams, only: [:new, :create, :show]
  end

end
