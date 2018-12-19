Rails.application.routes.draw do
  root 'welcome#index'
  get '/signin', to: 'seccions#new'
end
