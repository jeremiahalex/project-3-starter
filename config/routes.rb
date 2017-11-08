Rails.application.routes.draw do
  root 'pages#home'
  
  # devise_for :users

  devise_for :users, path: '', path_names: {
  sign_in: 'login', sign_out: 'logout',
  password:'secret',
  registration: 'register', edit: 'edit/profile'
  }
  # get 'pages/home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users, param: :name do
    resources :sessions
  # end
end
