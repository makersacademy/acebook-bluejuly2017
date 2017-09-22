Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :photos
  resources :friendships

  resources :random_images

  resources :posts do
    member do
      put "like" => "posts#upvote"
      put "unlike" => "posts#downvote"
    end
  end

  get '/users/:id/profile', to: 'users#show'

  get '/users/:id/edit', to: 'users#edit'
  put '/users/:id/edit', to: 'users#update'
  post '/posts/:id', to: 'posts#destroy'

  root to: redirect('/posts')
end
