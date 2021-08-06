Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'top/index' => 'top#index'
  get 'imgposts' => 'imgposts#index'
  get 'imgposts/new' => 'imgposts#new'
  get 'imgposts/:id' => 'imgposts#show', as: 'imgpost'
  post 'imgposts' => 'imgposts#create'
  patch 'imgposts/:id' => 'imgposts#update'
  delete 'imgposts/:id' => 'imgposts#destroy'
  get 'imgposts/:id/edit' => 'imgposts#update', as: 'edit_imgpost'
  root 'top#index'
  
end
