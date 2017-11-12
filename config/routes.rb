Rails.application.routes.draw do

  root 'static_pages#home'

  get  'static_pages/home'

  devise_scope :user do
    get '/profile', to: 'profile#show'
    get 'profile/edit', to: 'devise/registrations#edit'
  end

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register'
  }

  resources :children, except: [:edit, :new]
  get 'profile/children/edit', to: 'children#edit'
  get 'profile/children/new', to: 'children#new'
  get 'profile/children/delete', to: 'children#destroy'


  get '/browse', to: 'clothes#index'

  resources :cart

  post 'cart/checkout', to: 'cart#checkout'


  get '/loaned_item', to: 'loaned_item#index'
  get '/loaned_history', to: 'loaned_item#history'

  # resources :loaned_item
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
