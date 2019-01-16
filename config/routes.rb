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

  resources :users
  resources :shops do
    resources :user_shops, only: [:update]
    resources :likes, only: [:create]
    resources :rates, only: [:new, :create, :update]
  end

  namespace :genres do
    match "ramen", :via => :get
    match "sushi", :via => :get
  end
end
