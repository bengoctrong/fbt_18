Rails.application.routes.draw do
  namespace :admin do
    get "/booking_tours", to: "admin#new"
    patch "/booking_tours", to: "admin#create"
  end

  resources :tours, only: :show
  get "/login", to: "session#new"
  post "/login", to: "session#create"
  delete "/logout", to: "session#destroy"
  root "static_page#home"
  post "/bookings", to: "bookings#create"
end
