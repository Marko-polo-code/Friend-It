

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'pages#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :flats do
    resources :bookings, only: [:create, :show]
    resources :recommendations, only: [:new, :create]
    resources :contacts, only: [:new, :create, :show]
    resources :swap_requests, only: [:new, :show, :create]

    get "info", to: "flats#info", as: :info
  end


  resources :swap_requests, only: [] do
    put :accept
    put :reject
  end

  resources :bookings, only: [:show] do
    put :accept
    put :reject
    resources :payments, only: :new
  end

  resources :conversations do
   resources :messages
  end

  resources :recommendations, only: [:edit, :delete, :update]
  resources :contacts, only: [:edit, :delete, :update]

  get "/welcome", to: "pages#welcome", as: :welcome
  get "/admin_dashboard", to: "pages#admin_dashboard", as: :admin_dashboard
  get "/dashboard", to: "pages#dashboard", as: :dashboard
  get "/find_friends", to: "friends#find_friends", as: :find_friends
  post "/add_friends/:id", to: "friends#add_friends", as: :add_friends
  post "/accept_friends/:id", to: "friends#accept_friends", as: :accept_friends
  post "/block_friends/:id", to: "friends#block_friends", as: :block_friends
  post "/decline_friends/:id", to: "friends#decline_friends", as: :decline_friends
  post "/remove_friends/:id", to: "friends#remove_friends", as: :remove_friends

  post "/swap_requests/:id/accept", to: "swap_requests#accept", as: :accept_swap_request

  mount StripeEvent::Engine, at: '/stripe-webhooks'


end




