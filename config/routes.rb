Rails.application.routes.draw do
  resources :proposal_scores
  resources :proposals
  resources :tenderers
  resources :suppliers
  resources :tenders

  # post "/signup", to: "suppliers#create"
  get "/me", to: "suppliers#show"
  # post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  #supplier auth
  post '/login', to: 'auth#create'
  get '/profile', to: 'suppliers#profile'

  #tenderer auth
  post '/tenderer-login', to: 'tenderer_auth#create'
  get '/tenderer-profile', to: 'tenderers#tenderer_profile'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
