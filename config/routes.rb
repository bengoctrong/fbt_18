Rails.application.routes.draw do
  resources :tours, only: :show
  post "/login", to: "session#create"
  delete "/logout", to: "session#destroy"
  root "static_page#home"
end
