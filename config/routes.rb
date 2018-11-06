Rails.application.routes.draw do
  devise_for :users
  get 'shops/index'
  get 'shops/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'shops#index'
  get 'shops/show'
end
