Rails.application.routes.draw do
  resources :photos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :friendships
  resources :posts
  resources :users

  root to: redirect('/posts')

end
