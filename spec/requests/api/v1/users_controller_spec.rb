require 'swagger_helper'

RSpec.describe 'User Page', type: :request do
  describe 'Users API' do
    it('returns all users') do
      path '/api/v1/users' do
        post 'Create a user' do
          tags 'Users'
          consumes 'application/json'
          parameter name: :user, in: :body, schema: {
            type: :object,
            properties: {
              name: { type: :string }
            },
            required: %w[name]
          }
          response '201', 'user created' do
            let(:user) { { name: 'John' } }
            run_test!
          end
        end
      end
    end
  end
end
