Rails.application.routes.draw do
  resources :proposal_scores
  resources :proposals
  resources :tenderers
  resources :suppliers
  resources :tenders
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
