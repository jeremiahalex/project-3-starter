Rails.application.routes.draw do

  root 'bookings#home'
  get '/about', to: 'bookings#about'
  post '/about', to: 'bookings#about_post'
  post '/bookings/filter', to: 'bookings#filter'
  get '/logout', to: 'bookings#home'
  get '/thanks', to: 'bookings#thanks'
  get '/contactus', to: 'bookings#contactus'

  resource :bookings
  resources :charges

  devise_for :users,
  path: '',
  path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    password: 'secret',
    registration: 'register',
    # can change to registration: 'signup', <= to change the routes
    sign_up: ''
  }
end


# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
