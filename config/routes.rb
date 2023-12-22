Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :reservations, default: { format: :json }, only: [:index, :show, :create, :destroy]
      resources :motorcycles, default: { format: :json }, only: [:index, :show, :create, :destroy]
    end
  end
  root "application#root", default: {format: :json}
  post '/login', to: 'authentication#login'
end
