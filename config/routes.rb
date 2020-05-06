Rails.application.routes.draw do
  devise_for :users
  resources :shops do
    resources :products, only: [:new, :create]
  end
  resources :carts, only: [:index, :update] do
    resources :cart_products, only: [:create, :update, :destroy]
  end
  resources :products, only: [:edit, :update, :destroy]
  root to: 'shops#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
