Rails.application.routes.draw do

  root "sessions#new"

  resources :users, except: [:new]
  resources :sessions, except: [:new]
  resources :competitors, except: [:edit, :update]
  resources :matchups
  resources :bets

  get "/login", to: "sessions#new", as: :login
  get "/signup", to: "users#new", as: :signup
  delete "/logout", to: "sessions#destroy"

  post "/random", to: "matchups#create_random_matchup"

  #test route

  get "/placebet", to: "matchups#index"
  post "/placebet", to: "bets#new"


end
