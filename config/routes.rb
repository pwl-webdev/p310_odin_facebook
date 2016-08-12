Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  #devise_scope :user do
  #	delete 'sign_out', :to => 'devise/session#destroy', :as => :destroy_user_session
  #end

  root 'static_pages#home'
  resources :users, only: [:show, :index] do
  	member do
  		get :friends, :requested_friends, :pending_friends
  	end
  end
  resources :friendships, only:  [:create, :destroy, :update]
  resources :posts, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :likes, only: [:create]
end
