Rails.application.routes.draw do
  get 'restaurants/main'

  root 'static#home'

  get '/about', to: 'static#about'
  get '/profile', to: 'static#profile'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :restaurants
end
