Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, :only => [:index, :show]
  resources :posts, :only => [:new, :create, :show, :destroy] #maybe all if editable
  resources :comments, :only => [:new, :create, :destroy] #maybe all if editable
  resources :profiles, :only => [:edit, :update, :show]
  resources :likes, :only => [:create, :destroy]
  resources :friends, :only => [:create, :destroy]

  get 'users/notifications/:id', to: 'users#notifications', as: 'friend_requests'
  get 'users/friends/:id', to: 'users#friends', as: 'my_friends'
  post 'friends/:id', to: 'friends#approve', as: 'friend_approve'

end
