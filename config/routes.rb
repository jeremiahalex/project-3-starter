Rails.application.routes.draw do
  root 'pages#home'
  
  get 'pages/home'

  get 'users/index'

  get 'users/create'

  get 'users/new'

  get 'users/edit'

  get 'users/show'

  get 'users/update'

  get 'users/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
