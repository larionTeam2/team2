Rails.application.routes.draw do
  devise_for :admins
    mount RailsAdmin::Engine => '/admins', as: 'rails_admin'

  
  resources :admins
  get 'my_profile/index'

  resources :profiles
  get 'profile/index'

  post 'pictures/new'

 

  resources :pictures do
    resources :comments
    resources :likes

  end

  get '/search', to: 'home#search'
  
  devise_for :users,
  controllers:{omniauth_callbacks: "users/omniauth_callbacks"}


  
  resources :users
  get 'home/index'
  get 'users/sign_up'
  get 'users/password/new'
  root 'home#index'

  resources:my_profiles
  get 'home/index'
  root'home#index'


  resources:tasks
  get 'home/index'
  root 'home#index'


#login ggfb



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
