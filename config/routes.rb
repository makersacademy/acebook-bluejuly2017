Rails.application.routes.draw do
  resources :photos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :friendships
  resources :posts
  resources :users



  resources :random_images

  resources :posts do
    member do
      put "like" => "posts#upvote"
      put "unlike" => "posts#downvote"
    end
  end

  get '/users/:id/profile', to: 'users#show'



  root to: redirect('/posts')

end
