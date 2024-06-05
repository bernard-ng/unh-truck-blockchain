Rails.application.routes.draw do
  resources :users
  resources :trucks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  default_url_options :host => "truckchain.com"

  devise_for :users

  # Defines the root path route ("/")
  root "main#index"
end
