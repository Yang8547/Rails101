Rails.application.routes.draw do
  devise_for :users

  # nest route allow us to capture this relationship in our routing
  resources :groups do
    resources :posts
  end

  root to: 'groups#index'
end
