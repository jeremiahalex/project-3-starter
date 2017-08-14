Rails.application.routes.draw do
  root 'static#home'

resources :restaurants do
  resources :deals do
    resources :groups
  end
end


  get '/about', to: 'static#about'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
