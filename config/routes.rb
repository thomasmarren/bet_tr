Rails.application.routes.draw do

  root "matchups#index"

  resources :users, except: [:new]
  resources :sessions, except: [:new]
  resources :competitors, except: [:edit, :update]
  resources :matchups
  resources :bets
  resources :matchup_types

  get "/login", to: "sessions#new", as: :login
  get "/signup", to: "users#new", as: :signup
  delete "/logout", to: "sessions#destroy"

  post "/random", to: "matchups#create_random_matchup"

  get "/placebet", to: "matchups#index"
  post "/placebet", to: "bets#new"
  post "/setwinner", to: "matchups#update"
  get "/leaderboards", to: "bets#show"
  post "/closeall", to: "matchups#close_all"


end
