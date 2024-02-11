Rails.application.routes.draw do
  devise_for :users

  scope '/', defaults: { format: :json } do
    root to: 'home#index'
    resources :only_users
  end
end
