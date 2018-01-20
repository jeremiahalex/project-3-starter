Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # ========== Routing for index ==========
  root 'index#index'
  # ========== Routing for warranty ==========
  get '/warranty/', to: 'warranty#registration'
  # ========== Routing for account ==========
  # ========== Routing for admin ==========
  get '/admin/', to: 'admin#dashboard'
end
