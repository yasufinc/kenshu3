Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :tweets do
    resources :comments, only: [:create, :edit, :update, :destroy]
    post 'like' => 'tweet_likes#create'
    delete 'like' => 'tweet_likes#destroy'
  end

  resources :users, only: [:show]

  root 'tweets#index'
end
