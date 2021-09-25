Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # resources :my_threads do
  #   resources :comments, only: [:create, :edit, :update, :destroy]
  # end

  resources :tweets


  root 'tweets#index'
end
