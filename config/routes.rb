Rails.application.routes.draw do
  scope '/', defaults: { format: :json } do
    root to: 'home#index'
    post 'login', to: 'users#login'
    resources :users
    resources :wallets
  end
end
