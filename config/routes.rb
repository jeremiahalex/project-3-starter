Rails.application.routes.draw do

  root 'pages#home'
  resources :pages, only: [:show]
  resources :spaces do
    resources :bookmarks, only: [:create, :destroy]
    resources :reviews, only: [:create, :destroy]
  end
  resources :websites, only: [:create, :update]

  resources :users, only: [:show, :update]

  devise_for :users,
  path: '',
  path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    password: 'secret',
    confirmation: 'verification',
    unlock: 'unblock',
    registration: 'register',
    sign_up: ''
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
