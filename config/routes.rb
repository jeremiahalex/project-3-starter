Rails.application.routes.draw do
  root 'static#home'

  get '/about', to: 'static#about'

  devise_for :users,
            path: '',
            path_names: {
              sign_in: 'login',
              sign_out: 'logout',
              sign_up: 'register'
            }

  resources :events
  # resources :items

get '/items/new', to: 'items#new'
post '/items/new', to: 'items#new'
post '/items', to: 'items#results'
post '/items/create', to: 'items#create'
<<<<<<< HEAD
delete '/items/:id', to: 'items#destroy' 
  # get '/shoppinglist', to: 'shoppinglist#start'
  # post '/shoppinglist', to: 'shoppinglist#results'
  # post '/shoppinglist/basket', to: 'shoppinglist#basket'
=======
delete '/items/:id', to: 'items#destroy'
>>>>>>> upstream/master

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
