Rails.application.routes.draw do
  scope '/', defaults: { format: :json } do
    root to: 'home#index'
    resources :users
    post 'login', to: 'users#login'
  end
end
