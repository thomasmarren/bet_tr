Rails.application.routes.draw do

  root "sessions#new"

  resources :users, except: [:new]
  resources :sessions, except: [:new]

  get "/login", to: "sessions#new", as: :login
  get "/signup", to: "users#new", as: :signup
  delete "/logout", to: "sessions#destroy"


end
