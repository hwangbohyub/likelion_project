Rails.application.routes.draw do

  # get '/posts', to: 'posts#index'
  # get '/posts/:id', to: 'posts#show'
  # get '/posts/new', to: 'posts#new', as: 'new_post'
  # post '/posts', to: 'posts#create'
  # get '/posts/:id/edit', to: 'posts#edit', as: 'edit_post'
  # patch '/posts', to: 'posts#update'
  # delete '/posts', to: 'posts#destroy'

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  devise_for :users

  root 'home#main'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
