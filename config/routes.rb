Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts do
    member do
      put "like" => "posts#upvote"
      put "unlike" => "posts#downvote"
    end
  end

  get '/users/:id/profile', to: 'users#show'

  get '/newshineything', to: 'newshineything#index'

  root to: redirect('/posts')
end
