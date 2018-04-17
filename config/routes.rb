Rails.application.routes.draw do
  devise_for :users
  root to: 'jets#index'
  resources :jets do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index, :show, :edit, :update, :destroy]
  resources :search_airports, only: [:index]
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

