Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :reservations, default: { format: :json }, except: [:update], only: [:index, :create, :show, :destroy]
      resources :motorcycles, default: { format: :json }, except: [:update], only: [:index, :show, :create, :destroy]
      post '/login', to: 'authentication#login'
    end
  end
  # get "up" => "rails/health#show", as: :rails_health_check
  # Defines the root path route ("/")
end
