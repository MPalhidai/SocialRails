Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/sign_up' => 'devise/registrations#create'
  end
  root 'static_pages#home'
  resources :users, :only => [:index]

end
