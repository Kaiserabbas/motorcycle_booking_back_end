Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :reservations, default: { format: :json }, only: [:index, :show, :create, :destroy]
      resources :motorcycles, default: { format: :json }, only: [:index, :show, :create, :destroy]
      post '/login', to: 'authentication#login', default: {format: :json}
    end
  end
  root "application#root", default: {format: :json}
end
