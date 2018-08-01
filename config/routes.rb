Rails.application.routes.draw do
  devise_for :users

  resources :users, :only => [:index, :show]
  resources :posts, :only => [:new, :create, :show, :destroy] #maybe all if editable
  resources :comments, :only => [:new, :create, :destroy] #maybe all if editable
  resources :profiles, :only => [:edit, :update, :show]
  resources :likes, :only => [:create, :destroy]
  resources :friends, :only => [:create, :destroy]

  root 'static_pages#home'
  get 'users/notifications'
  get 'users/friends'
end
