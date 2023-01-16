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

  post '/login', to: 'auth#create'
  get '/profile', to: 'suppliers#profile'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
