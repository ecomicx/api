Rails.application.routes.draw do
  root to: 'home#index'
  # devise_for :users

  resources :only_users, only: %i[create index show edit update]

  Rails.application.routes.draw do
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
  end
end
