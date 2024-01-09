require 'swagger_helper'

RSpec.describe 'api/v1/authentication', type: :request do
  path '/api/v1/login' do
    post('login authentication') do
      consumes 'application/json'
      parameter name: :login_params, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          password: { type: :string }
        },
        required: %w[name password]
      }

      response '201', 'successful' do
        let(:user) { FactoryBot.create(:user) }
        let(:login_params) { { name: user.name, password: user.password } }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response '401', 'unauthorized' do
        let(:login_params) { { name: 'nonexistent_user', password: 'invalid_password' } }
        run_test!
      end
    end
  end
end
