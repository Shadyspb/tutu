Rails.application.routes.draw do
  resources :trains do
    resources :cars
  end
  resources :railway_stations do
    patch :update_position, on: :member
    patch :update_time, on: :member
  end
  resources :routes
  resources :tickets
  resources :users
  resources :cars
  resource :search, only: [:show]

  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
