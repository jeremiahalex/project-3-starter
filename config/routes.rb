Rails.application.routes.draw do
  root 'pages#home'

  # devise_for :users

  devise_for :users, path: '', path_names: {
  sign_in: 'login', sign_out: 'logout',
  password:'secret',
  registration: 'register', edit: 'edit/profile'
  }

  devise_scope :user do
   root to: 'pages#home'
   match '/sessions/user', to: 'devise/sessions#create', via: :post

 end
  # get 'pages/home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :lessons
    resources :bookings
    resources :charges
    resources :testimonials
    get '/about', to: 'pages#about'

end
