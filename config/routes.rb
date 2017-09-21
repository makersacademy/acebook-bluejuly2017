Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts

  get '/users/:id/profile', to: 'users#show'

  root to: redirect('/posts')

  resources :insults

  get '/posts/insult'
end
