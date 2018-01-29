Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # ========== Routing for index ==========
  root 'index#index'
  # ========== Routing for warranty ==========
  get '/warranty/register', to: 'warranty#new'
  post '/warranty/register', to: 'warranty#create'
  # resources :warranty, only: [:new, :create]
  # ========== Routing for account ==========
  resources :account, only: [:index]
  devise_for :accounts, path: 'account', path_names:
  { sign_in: 'login',
    sign_out: 'logout',
    password: 'secret',
    registration: '',
    edit: 'edit',
  }
  # ========== Routing for admin ==========
  resources :admin, only: [:index]
  # ========== Routing for products ==========
  namespace :admin do
    resources :products
  end
  # 404
end
