Rails.application.routes.draw do
   resources :reservations, default:{format: :json}
  resources :motorcycles, default: {format: :json}, except:[:update]
  get "up" => "rails/health#show", as: :rails_health_check
  # Defines the root path route ("/")
end
