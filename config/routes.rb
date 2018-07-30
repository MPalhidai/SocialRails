Rails.application.routes.draw do
  get 'comments/new'
  get 'comments/create'
  get 'comments/destroy'
  get 'friends/create'
  get 'friends/destroy'
  get 'friends/approve'
  get 'likes/create'
  get 'likes/destroy'
  get 'profile/edit'
  get 'profile/update'
  get 'profile/show'
  get 'posts/new'
  get 'posts/create'
  get 'posts/show'
  get 'posts/destroy'
  devise_for :users
  root 'static_pages#home'
  resources :users, :only => [:index]

end
