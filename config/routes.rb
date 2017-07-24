Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => "restaurants#index"

  namespace :admin do
    resources :restaurants
    resources :categories
  end

  resources :restaurants do
    resources :comments
  end

  resources :categories do
    resources :restaurants, :controller => 'category_restaurants'
  end

end
