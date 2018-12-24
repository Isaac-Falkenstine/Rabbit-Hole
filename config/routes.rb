Rails.application.routes.draw do
  root 'welcome#index'

  get "auth/:provider/callback", to: "google_oauth#update"
  get "auth/failure", to: redirect("/")

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  get '/register', to: "users#new"
  post '/register', to: "users#create"

  resources :users, only: [:create]

  namespace :user do
    get '/dashboard', to: "topics#index", as: "/dashboard"
    resources :topics, only: [:new, :create, :show]  do
      resources :questions, only: [:new, :create]
    end
  end
end
