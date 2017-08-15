Rails.application.routes.draw do

  get 'restaurants/main'
  get '/profile/groups', to: 'groups#show_current_user'
  get '/profile/groups/:id/restaurant/show', to: 'groups#show_restaurant_on_profile'

  root 'static#home'

  get '/about', to: 'static#about'
  get '/profile', to: 'static#profile'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :restaurants, shallow: true do
    resources :deals do
      resources :groups
    end
  end
  
end
