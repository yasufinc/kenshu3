Rails.application.routes.draw do
  #devise_for :users
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :tweets do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end

  resources :tweets

  root 'tweets#index'
end
