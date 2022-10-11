require 'swagger_helper'

describe 'Reservations API' do
  it('gets all reservations') do
    path '/api/v1/users/{id}/reservations' do
      get 'Get all reservations' do
        tags 'Reservations'
        produces 'application/json'
        parameter name: :id, in: :path, type: :string
        response '200', 'reservations found' do
          schema type: :array, items: { '$ref' => '#/components/schemas/Post' }
          run_test!
        end
      end
    end
  end

  it('gets a reservation') do
    path '/api/v1/users/{id}/reservations/{id}' do
      get 'Get reservation by id' do
        tags 'Reservations'
        produces 'application/json'
        parameter name: :id, in: :path, type: :string
        response '200', 'post found' do
          schema '$ref' => '#/components/schemas/Post'
          run_test!
        end
      end
    end
  end

  it('Creates a reservation') do
    path '/api/v1/users/{id}/reservations' do
      post 'Create a reservation' do
        tags 'Reservations'
        consumes 'application/json'
        parameter name: :reservation, in: :body, schema: {
          type: :object,
          properties: {
            user_id: { type: :integer },
            room_id: { type: :integer },
            date: { type: :string },
            city: { type: :string }
          },
          required: %w[user_id room_id]
        }

        response '201', 'reservation created' do
          let(:reservation) { { room_id: '1', user_id: '{id}', date: '2021-09-30', city: 'New York' } }
          run_test!
        end
      end
    end
  end
end
