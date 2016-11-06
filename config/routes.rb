Rails.application.routes.draw do
  root to: 'home#show'

  namespace :admin do
    get '/dashboard', to: 'teams#index'
    resources :teams, only: [:new, :create, :show]
  end
end
