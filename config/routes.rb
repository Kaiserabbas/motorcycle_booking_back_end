Rails.application.routes.draw do
   resources :reservations, default:{format: :json}
  resources :motorcycles, only:[:destroy, :index]
  get "/apaga/:id", to: "motorcycles#destroy", default: {format: :json}
  get "up" => "rails/health#show", as: :rails_health_check
  # Defines the root path route ("/")
  root "motorcycles#index"
end
