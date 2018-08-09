Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users
  resources :users, :only => [:index, :show]
  get 'users/notifications/:id', to: 'users#notifications', as: 'friend_requests'
  get 'users/friends/:id', to: 'users#friends', as: 'my_friends'

  resources :posts, :only => [:new, :create, :show, :destroy] #maybe all if editable
  resources :comments, :only => [:new, :create, :destroy] #maybe all if editable
  resources :profiles, :only => [:edit, :update, :show]
  resources :likes, :only => [:create, :destroy]
  resources :friends, :only => [:create, :destroy]

end
