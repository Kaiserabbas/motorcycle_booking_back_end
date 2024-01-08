# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin Ajax requests.

# Read more: https://github.com/cyu/rack-cors

# Rails.application.config.middleware.insert_before 0, Rack::Cors do
#   allow do
#     origins "example.com"
#
#     resource "*",
#       headers: :any,
#       methods: [:get, :post, :put, :patch, :delete, :options, :head]
#   end
# end
Rails.application.config.middleware.insert_before 0, Rack::Cors do
     allow do
       origins 'http://localhost:3001' # Update this with the actual origin of your React app
       resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: false
     end

     allow do
       origins 'http://192.168.43.117:3001' # Update this with the actual origin of your React app
       resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: false
     end
  end
