require 'rails_helper'

RSpec.describe 'User Page', type: :request do
  describe 'POST /User' do
    it 'create new user' do
      post '/api/v1/users', params: { user: { name: 'John' } }
      expect(response).to have_http_status(:created)
    end
  end
end
