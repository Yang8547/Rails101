Rails.application.routes.draw do
  devise_for :users

  # nest route allow us to capture this relationship in our routing
  resources :groups do
    member do
      post :join
      post :quit
    end
    resources :posts
  end

  namespace :account do
    resources :groups
  end

  namespace :account do
    resources :posts
  end

  root to: 'groups#index'
end
