Rails.application.routes.draw do
  root to: 'home#index'

  # resources :only_users, only: [:create, :index, :show, :edit, :update]


end