Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :relationships, only: [:create, :destroy]
  get 'top/index' => 'top#index'
  resources :imgposts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  resources :comments, only: [:destroy]
  root 'top#index'
  
end
