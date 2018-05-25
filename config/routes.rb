Rails.application.routes.draw do
  # get 'comments/new'
  #
  # root 'posts#index'
  #
  # get 'posts/index'
  #
  # get 'posts/new'
  # post 'posts/create' => 'posts#create'
  #
  # get 'posts/show/:id' => 'posts#show'
  #
  # get 'posts/edit/:id' => 'posts#edit'
  # post 'posts/update/:id' => 'posts#update'
  #
  # get 'posts/destroy/:id' => 'posts#destroy'
  #
  # post '/posts/comment_create/:id' => 'posts#comment_create'


  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
