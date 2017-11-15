Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'static_pages#home'

  get  'static_pages/home'

  devise_scope :user do
    get '/profile', to: 'profile#show'
    get 'profile/edit', to: 'devise/registrations#edit'
  end
  devise_for :users, :controllers => {
    registrations: "users/registrations",
    sessions: "users/sessions"
  },
  path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register'
  }

  resources :children, except: [:edit, :new]
  get 'profile/children/edit', to: 'children#edit'
  get 'profile/children/new', to: 'children#new'
  get 'profile/children/delete', to: 'children#destroy'
  patch 'profile/children/update_child_size', to: 'children#update_size'

  # get '/browse', to: 'clothes#index'

  resources :cart

  post 'cart/checkout', to: 'cart#checkout'


  get '/my_order', to: 'loaned_item#index'
  get '/loaned_history', to: 'loaned_item#history'

  # resources :loaned_item
  get '/choose_size_style', to: 'filter_form#index'
  get '/choose_size_style/:size', to: 'filter_form#form1'
  get '/choose_size_style/:size/:style', to: 'filter_form#form2'
  get '/choose_size_style/:size/:style/browse', to: 'clothes#index'
  resources :clothes, only: [:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
