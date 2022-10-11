require 'swagger_helper'

RSpec.describe 'Rooms Page', type: :request do
  describe 'Rooms API' do
    it('returns all rooms') do
      path '/api/v1/rooms' do
        get 'Get all rooms' do
          tags 'Rooms'
          produces 'application/json'
          response '200', 'OK' do
            schema type: :array, items: { '$ref' => '#/components/schemas/Room' }
            run_test!
          end
        end
      end
    end

    it('should return all rooms') do
      path '/api/v1/rooms/{id}' do
        get 'Get room by id' do
          tags 'Rooms'
          produces 'application/json'
          parameter name: :id, in: :path, type: :string
          response '200', 'OK' do
            schema '$ref' => '#/components/schemas/Room'
            run_test!
          end
        end
      end
    end

    it('should create a room') do
      path '/api/v1/rooms' do
        post 'Create a room' do
          tags 'Rooms'
          consumes 'application/json'
          parameter name: :room, in: :body, schema: {
            type: :object,
            properties: {
              name: { type: :string },
              description: { type: :string },
              size: { type: :integer },
              view: { type: :string },
              bedding: { type: :string },
              image: { type: :string }
            },
            required: %w[name description size view bedding image]
          }

          response '201', 'OK' do
            let(:room) { { name: 'John', description: 'description text', size: 1, view: 'John', bedding: 'Doe', image: 'John' } }
            run_test!
          end
        end
      end
    end

    it('should delete a room') do
      path '/api/v1/rooms/{id}' do
        delete 'Delete room by id' do
          tags 'Rooms'
          produces 'application/json'
          parameter name: :id, in: :path, type: :string
          response '204', 'room deleted' do
            run_test!
          end
        end
      end
    end
  end
end
