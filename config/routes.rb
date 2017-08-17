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
  
get '/items', to: 'items#results'
post '/items', to: 'items#results'
post '/items/create', to: 'items#create'
delete '/items/:id', to: 'items#destroy', as: 'items_delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
