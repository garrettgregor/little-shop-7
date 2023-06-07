Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "application#welcome"

  resources :admin, only: [:index]
  namespace :admin do
    resources :merchants, only: [:index]
    resources :invoices, only: [:index, :show, :update]
  end
end
