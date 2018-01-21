Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # ========== Routing for index ==========
  root 'index#index'
  # ========== Routing for warranty ==========
  get '/warranty/', to: 'warranty#register'
  # ========== Routing for account ==========
  get '/account/home', to: 'account#home'
  get '/account/signup', to: 'account#signup'
  get '/account/login', to: 'account#login'
  get '/account/edit', to: 'account#edit'
  # ========== Routing for admin ==========
  get '/admin/', to: 'admin#dashboard'
end
