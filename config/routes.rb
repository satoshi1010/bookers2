Rails.application.routes.draw do
 devise_for :users
 root to: 'homes#top'
 get 'home/about' => 'homes#about'
 get 'user/index' => 'users#index'
 resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
 resources :users, only: [:show, :edit, :update, :index]
end
