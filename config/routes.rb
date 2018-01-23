Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # ========== Routing for index ==========
  root 'index#index'
  # ========== Routing for warranty ==========
  get '/warranty/register', to: 'warranty#register'
  # ========== Routing for account ==========
  get '/account/home', to: 'account#home'

  get '/account/signup', to: 'account#signup'
  post '/account/create', to: 'account#create'

  get '/account/login', to: 'account#login'
  post '/account/authenticate', to: 'account#authenticate'

  get '/account/:id/edit', to: 'account#edit', as: "edit_account"
  put '/account/:id', to: 'account#update'
  patch '/account/:id', to: 'account#update'

  # delete '/account/:id', to: 'account#delete'
  # ========== Routing for admin ==========
  resources :admin, only: [:index]
  # ========== Routing for products ==========
  namespace :admin do
    resources :products
  end
end
