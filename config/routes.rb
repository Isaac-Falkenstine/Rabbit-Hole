Rails.application.routes.draw do
  root 'welcome#index'

  get "auth/:provider/callback", to: "google_oauth#update"
  get "auth/failure", to: redirect("/")

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  get '/dashboard', to: "users#show"

end
