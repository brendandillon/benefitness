Rails.application.routes.draw do
  root to: 'home#show'
  resources :users, only: [:new, :create]

  namespace :admin do
    resources :teams, only: [:new, :create, :show]
  end
end
