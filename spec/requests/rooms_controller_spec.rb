require 'rails_helper'

RSpec.describe 'Rooms Page', type: :request do
  describe 'GET #index' do
    before do
      @room = Room.create(name: 'Deluxe, Guest room', description: 'Deluxe, Guest room, 1 King. Sleep soundly in Bodrum on the indulgent bedding and crisp linens in all of our resort hotel rooms', size: '45', view: 'Sea', bedding: 'Twin', image: 'https://cache.marriott.com/content/dam/marriott-renditions/BJVEB/bjveb-deluxe-0003-hor-wide.jpg?output-quality=70&interpolation=progressive-bilinear&downsize=1336px')
    end
    it 'is a HTTP success' do
      get(api_v1_rooms_path)
      expect(response).to have_http_status(:ok)
    end

    it 'shows the name in the show page ' do
      get(api_v1_rooms_path(@room))
      expect(response.body).to include(@room.name)
    end
  end
end
