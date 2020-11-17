Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  get 'items', to: 'items#calced'
  root to: "items#index"
  resources :items
end
