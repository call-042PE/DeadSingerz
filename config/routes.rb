Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'users/bookings', to: "bookings#index"
  get 'dashboard', to: "users#index"
  get 'dashboard/bookings', to: "bookings#index"

  resources :users

  resources :singers do
    resources :bookings, only: [ :new, :create ]
  end
end
