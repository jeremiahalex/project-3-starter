Rails.application.routes.draw do
  root 'pages#home'

  get 'pages/login'

  get 'pages/search'

  get 'pages/profile'

  get 'pages/result'

  get 'pages/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
