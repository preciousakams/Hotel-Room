require 'rails_helper'

RSpec.describe 'Rooms Page', type: :request do
  describe 'GET /Rooms' do
    before :each do
      Room.create(name: 'Deluxe, Guest room', description: 'Deluxe, Guest room, 1 King. Sleep soundly in Bodrum on the indulgent bedding and crisp linens in all of our resort hotel rooms', size: '45', view: 'Sea', bedding: 'Twin', image: 'https://cache.marriott.com/content/dam/marriott-renditions/BJVEB/bjveb-deluxe-0003-hor-wide.jpg?output-quality=70&interpolation=progressive-bilinear&downsize=1336px')
    end
    it 'returns all rooms' do
      get '/api/v1/rooms'
      expect(response).to have_http_status(:ok)
    end
    it 'returns all rooms in a json format' do
      get '/api/v1/rooms'
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(JSON.parse(response.body)).to be_an_instance_of(Array)
      expect(JSON.parse(response.body).first).to be_an_instance_of(Hash)
      expect(JSON.parse(response.body).first.keys).to eq(%w[id name description size view bedding image created_at updated_at])
      expect(JSON.parse(response.body).first.values).to be_an_instance_of(Array)
    end
  end
  describe 'GET /Room' do
    before :each do
      @room = Room.create(name: 'Deluxe, Guest room', description: 'Deluxe, Guest room, 1 King. Sleep soundly in Bodrum on the indulgent bedding and crisp linens in all of our resort hotel rooms', size: '45', view: 'Sea', bedding: 'Twin', image: 'https://cache.marriott.com/content/dam/marriott-renditions/BJVEB/bjveb-deluxe-0003-hor-wide.jpg?output-quality=70&interpolation=progressive-bilinear&downsize=1336px')
    end
    it 'returns a response with the status code 200' do
      get "/api/v1/rooms/#{@room.id}"
      expect(response).to have_http_status(:ok)
    end
    it 'returns a room in a json format' do
      get "/api/v1/rooms/#{@room.id}"
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(JSON.parse(response.body)).to be_an_instance_of(Hash)
      expect(JSON.parse(response.body).keys).to eq(%w[id name description size view bedding image created_at updated_at])
      expect(JSON.parse(response.body).values).to be_an_instance_of(Array)
    end
  end
  describe 'POST /Room' do
    it 'create new room' do
      post '/api/v1/rooms', params: { room: { name: 'Deluxe, Guest room', description: 'Deluxe, Guest room, 1 King. Sleep soundly in Bodrum on the indulgent bedding and crisp linens in all of our resort hotel rooms', size: '45', view: 'Sea', bedding: 'Twin', image: 'a' } }
      expect(response).to have_http_status(:created)
    end
  end
  describe 'DELETE /Room' do
    it 'deletes a room' do
      room = Room.create(name: 'Deluxe, Guest room', description: 'Deluxe, Guest room, 1 King. Sleep soundly in Bodrum on the indulgent bedding and crisp linens in all of our resort hotel rooms', size: '45', view: 'Sea', bedding: 'Twin', image: 'https://cache.marriott.com/content/dam/marriott-renditions/BJVEB/bjveb-deluxe-0003-hor-wide.jpg?output-quality=70&interpolation=progressive-bilinear&downsize=1336px')
      delete "/api/v1/rooms/#{room.id}"
      expect(response).to have_http_status(:no_content)
    end
  end
end
