Rails.application.routes.draw do

  get 'restaurants/main'
  get '/profile/groups', to: 'groups#show_current_user'
  get '/profile/groups/:id/restaurant/show', to: 'groups#show_restaurant_on_profile'

  root 'static#home'

resources :restaurants do
  resources :deals do
    resources :groups
  end
end


  get '/about', to: 'static#about'
  get '/profile', to: 'static#profile'

  devise_for :users
  resources :restaurants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :restaurants do
    resources :deals do
      resources :groups
    end
  end


end
