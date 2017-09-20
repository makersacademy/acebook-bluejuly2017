Rails.application.routes.draw do
  resources :friends
  resources :photos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
  resources :friendslist 
  resources :users, controller: 'users', only: 'create'

  root to: redirect('/posts')
end
