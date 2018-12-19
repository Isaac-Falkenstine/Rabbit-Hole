Rails.application.routes.draw do
  root 'welcome#index'

  get "auth/:provider/callback", to: "google_oauth#update"
  get "auth/failure", to: redirect("/")

end
