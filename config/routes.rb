Rails.application.routes.draw do
  root 'welcome#index'
<<<<<<< HEAD
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/dashboard', to: 'users#show'
=======

  get "auth/:provider/callback", to: "google_oauth#update"
  get "auth/failure", to: redirect("/")

>>>>>>> 10_google_oauth_master
end
