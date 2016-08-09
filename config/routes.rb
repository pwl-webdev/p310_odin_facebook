Rails.application.routes.draw do

  devise_for :users
  root 'static_pages#home'
  resources :users, only: [:show, :index] do
  	member do
  		get :friends, :requested_friends, :pending_friends
  	end
  end
  resources :friendships, only:  [:create, :destroy, :update]
  resources :posts, only: [:create, :destroy]
end
