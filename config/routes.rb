Rails.application.routes.draw do
  root "static_page#home"
  resources :tours, only: :show
  resources :reviews, only: %i(create destroy)
  namespace :admin do
    get "/booking_tours", to: "admin#new"
    patch "/booking_tours", to: "admin#create"
  end

  get "/profile", to: "users#show"
  patch "/cancel_booking", to: "users#cancel_booking"
  get "/login", to: "session#new"
  post "/login", to: "session#create"
  delete "/logout", to: "session#destroy"
  post "/bookings", to: "bookings#create"
end
