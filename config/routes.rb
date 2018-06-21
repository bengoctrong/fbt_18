Rails.application.routes.draw do
  root "static_page#home"
  get "/login", to: "session#new"
  post "/login", to: "session#create"
  delete "/logout", to: "session#destroy"
end
