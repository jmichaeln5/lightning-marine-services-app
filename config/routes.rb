Rails.application.routes.draw do
  devise_for :users

  resources :users do
    resources :purchasers, shallow: true
  end

  # resources :purchasers do
  #   resources :vendors, shallow: true
  # end

  resources :purchasers do
    resources :vendors
  end

  resources :vendors


  # get 'vendors', to: 'vendors#index'

  root 'pages#index'
  get 'pages/landing_page'
  get 'pages/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
