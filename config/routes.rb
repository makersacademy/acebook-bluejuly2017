Rails.application.routes.draw do
  get 'twitter_api/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts

  root to: redirect('/posts')
end
