Rails.application.routes.draw do

  root "matchups#index"

  resources :users, except: [:new]
  resources :sessions, except: [:new, :destroy]
  resources :competitors, except: [:edit, :update]
  resources :matchups
  resources :matchup_types
  resources :bets, except: [:new]

  get "/signup", to: "users#new", as: :signup
  get "/login", to: "sessions#new", as: :login
  delete "/logout", to: "sessions#destroy"

  #Random matchup
  post "/random", to: "matchups#create_random_matchup"

  #Bets
  get "/placebet", to: "matchups#index"
  post "/placebet", to: "bets#new"

  #Admin capabilities
  get "/admin", to: "sessions#admin"
  post "/admin", to: "sessions#make_admin"
  post "/setwinner", to: "matchups#update"
  get "/leaderboards", to: "bets#show"
  post "/closeall", to: "matchups#close_all"




end
