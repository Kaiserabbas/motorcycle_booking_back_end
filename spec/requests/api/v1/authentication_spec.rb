require 'swagger_helper'

RSpec.describe 'api/v1/authentication', type: :request do
  path '/api/v1/login' do
    post('login authentication') do
      consumes 'application/json'
      parameter name: :login_params, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: %w[email password]
      }

      # response '201', 'successful' do
      #   let(:user) { FactoryBot.create(:user) }
      #   let(:login_params) { { email: user.email, password: user.password } }
      #   # let(:login_params) { { email: 'login@gmail.com', password: '123456' } }

      #   after do |example|
      #     example.metadata[:response][:content] = {
      #       'application/json' => {
      #         example: JSON.parse(response.body, symbolize_names: true)
      #       }
      #     }
      #   end
      #   run_test!
      # end

      # response '401', 'unauthorized' do
      #   let(:login_params) { { email: 'nonexistent_user', password: 'invalid_password' } }
      #   run_test!
      # end
    end
  end
end
