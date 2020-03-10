Rails.application.routes.draw do
  devise_for :users
  root to: 'flats#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :flats do 
    resources :bookings, only: [:show, :create]
    resources :recommendations, only: [:new, :create]
    resources :contacts, only: [:new, :create, :show]
    resources :swap_requests, only: [:show, :create]
  end

  resources :recommendations, only: [:edit, :delete, :update]
  resources :contacts, only: [:edit, :delete, :update]

end
