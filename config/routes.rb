Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'users/bookings', to: "bookings#index"
  get 'dashboard', to: "users#index"
  get 'dashboard/bookings', to: "bookings#index"
  get '/api/get/userbookings', to: "bookings#userbookings"
  get '/api/get/waitingbookings', to: "bookings#waitingbookings"
  get '/api/get/singer/:id', to: "singers#getsinger"

  resources :users

  resources :singers do
    resources :ratings
    resources :bookings, only: [ :new, :create, :update, :destroy ]
  end
end
