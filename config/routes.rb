Rails.application.routes.draw do
  resources :tours, only: :show
  get "/login", to: "session#new"
  post "/login", to: "session#create"
  delete "/logout", to: "session#destroy"
  root "static_page#home"
  post "/bookings", to: "bookings#create"
end
