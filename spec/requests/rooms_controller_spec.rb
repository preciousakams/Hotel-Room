require 'rails_helper'

RSpec.describe 'Rooms Page', type: :request do
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
