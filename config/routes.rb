Rails.application.routes.draw do
   resources :reservations, default: {format: :json}, except:[:update]
  resources :motorcycles, default: {format: :json}, except:[:update]
    namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#login'
    end
  end
  # get "up" => "rails/health#show", as: :rails_health_check
  # Defines the root path route ("/")
end
