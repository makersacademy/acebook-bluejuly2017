Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
  resources :users, controller: 'users', only: 'create'

  get '/users/:id/profile', to: 'users#show'

  get '/users/:id/edit', to: 'users#edit'
  put '/users/:id/edit', to: 'users#update'

  root to: redirect('/posts')
end
