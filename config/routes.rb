Rails.application.routes.draw do
  devise_for :users
  root "static_page#home"
  resources :tours, only: :show
  resources :reviews, only: %i(create destroy)
  resources :rates, only: :create
  resources :users, only: :show
  namespace :admin do
    devise_for :tours, except: %i(show new)
    devise_for :bookings, only: %i(index edit)
  end

  patch "/cancel_booking", to: "users#cancel_booking"
  get "/login", to: "session#new"
  post "/login", to: "session#create"
  delete "/logout", to: "session#destroy"
  delete "/deletereview", to: "review#destroy"
  post "/bookings", to: "bookings#create"
end
