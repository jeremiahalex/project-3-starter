Rails.application.routes.draw do

  get 'products/create'

  root 'pages#home'
  resources :pages, only: [:show]

  patch '/spaces/:id/about', to: 'spaces#about', as: 'about'
  patch '/spaces/:id/website', to: 'spaces#website', as: 'website'
  post '/spaces/:id/photo', to: 'spaces#photo', as: 'photo'
  # post '/spaces/:id/product', to: 'spaces#product', as: 'product'


  resources :spaces do
    resources :bookmarks, only: [:create, :destroy]
    resources :reviews, only: [:create, :destroy]
    resources :products, only: [:create]

  end
  # resources :websites, only: [:create, :update]

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
