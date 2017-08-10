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
  resources :items

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
