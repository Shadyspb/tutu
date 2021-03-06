Rails.application.routes.draw do
  devise_for :users

  #resources :cars
  resource :search, only: [:show, :create]
  resources :tickets
  resources :routes

  namespace :admin do
    resources :trains do
      resources :cars
    end

    resources :railway_stations do
      patch :update_position, on: :member
      patch :update_time, on: :member
    end
    resources :routes
    resources :tickets
    root 'welcome#index'
  end

  get 'welcome/index'
  root 'searches#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
