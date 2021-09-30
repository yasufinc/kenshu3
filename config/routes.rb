Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    delete 'users/sign_out', to: 'devise/sessions#destroy'
  end

  resources :tweets do
    resources :comments, only: [:create, :edit, :update, :destroy]
    post 'like' => 'tweet_likes#create'
    delete 'like' => 'tweet_likes#destroy'
  end

  resources :users, only: [:show] do
    resources :relationships, only: [:create, :destroy]
  end

  root 'tweets#index'
end
