Rails.application.routes.draw do

  root 'static_pages#home'
  get  'static_pages/home'

  devise_for :users, path: '', path_names: {
    sign_in: 'login', sign_out: 'logout',
    sign_up: 'register' }
  resources :users, only: [:index]
  get '/users/:name', to: 'users#show'
  get 'profile', to: 'devise/registrations#edit'


  resources :children
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
