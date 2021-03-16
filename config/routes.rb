Rails.application.routes.draw do


  root 'pages#index'
  devise_for :users
  get 'pages/landing_page'
  get 'pages/about'


  resources :users do
    resources :purchasers, shallow: true
  end

  # resources :purchasers do          # Shallow
  #   resources :vendors, only: [:index, :new, :create]
  # end
  # resources :vendors, only: [:show, :edit, :update, :destroy]

  resources :purchasers do
    resources :vendors, shallow: true
  end

  get 'all_vendors', to: 'vendors#all_vendors'

  resources :vendors do
    resources :orders, shallow: true
  end

  get 'all_orders', to: 'orders#all_orders'

  get 'purchaser_orders', to: 'purchasers#purchaser_orders'
  # get 'purchaser_orders/:id', to: 'purchasers#purchaser_orders'
  get '/purchasers/:id/purchaser_orders', to: 'purchasers#purchaser_orders'



  # resources :purchasers do
  #   resources :orders
  # end

  resources :orders # For now

  get '/vendors/:id/orders', to: 'orders#index'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
