Rails.application.routes.draw do
  get 'view_image/index'

  get 'my_profile/index'

  resources :profiles
  get 'profile/index'

  post 'pictures/new'

 

  resources :pictures do
    resources :comments
    resources :likes
  end

  
  devise_for :users
  resources :users
  get 'home/index'
  get 'users/sign_up'
  get 'users/password/new'
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
