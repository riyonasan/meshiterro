Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :admin_users
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root 'shops#index'
  get 'shops/show'
  get 'search', to: 'shops#search'

  resources :users
  resources :shops do
    resources :user_shops, only: [:update]
    resources :likes, only: [:create, :destroy]
    resources :rates, only: [:create, :destroy]
  end

  namespace :genres do
    match "ramen", :via => :get
    match "sushi", :via => :get
  end
end
