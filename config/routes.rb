Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # ========== Routing for index ==========
  root 'index#index'
  # ========== Routing for warranty ==========
  get '/warranty/', to: 'warranty#index'
  get '/warranty/register', to: 'warranty#new'
  post '/warranty/register', to: 'warranty#create'
  # resources :warranty, only: [:new, :create]
  # ========== Routing for account ==========
  resources :account, only: [:index]
  devise_for :accounts, path: 'account',
  path_names:{ sign_in: 'login',
                sign_out: 'logout',
                password: 'secret',
                edit: 'edit',
              }
  # ========== Routing for admin ==========
  resources :admin, only: [:index]
  # ========== Routing for products ==========
  namespace :admin do
    resources :products
  end
  # ========== Routing for tickets ==========
  namespace :account do
    resources :tickets
  end
  # 404
  match "*path", to: "index#catch_404", via: :all
end
