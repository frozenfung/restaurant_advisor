Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => "restaurants#index"

  namespace :admin do
    resources :restaurants do
      resource :location, :controller => 'restaurant_locations'
    end
    resources :categories
  end

  resources :restaurants do
    resources :comments
    member do
      post :favorite
      post :unfavorite
    end
    collection do
      get :dashboard
    end
  end

  resources :categories do
    resources :restaurants, :controller => 'category_restaurants'
  end

  resources :users
  resources :friendships, only: [ :create, :destroy]

end
