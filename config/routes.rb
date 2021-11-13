Rails.application.routes.draw do
  devise_for :users
 get 'users/show'
 root to: 'homes#top'
 get 'home/about' => 'homes#about'
 resources :post_images, only: [:new, :create, :index, :show, :destroy]
 resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
 resources :users, only: [:show, :edit, :update]
 post 'books' => 'users#create'
 get 'users' => 'users#index'
 get 'books' => 'books#index'
end
