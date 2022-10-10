require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before :all do
    @user = User.new(email: 'test@test.com', name: 'Johnny', username: 'Test')
    @room = Room.new(name: 'Deluxe, Guest room', description: 'Deluxe, Guest room, 1 King. Sleep soundly in Bodrum on the indulgent bedding and crisp linens in all of our resort hotel rooms', size: '45', view: 'Sea', bedding: 'Twin', image: 'https://cache.marriott.com/content/dam/marriott-renditions/BJVEB/bjveb-deluxe-0003-hor-wide.jpg?output-quality=70&interpolation=progressive-bilinear&downsize=1336px')
    @reservation = Reservation.new(user_id: @user.user_id, room_id: @room.room_id, start_date: '03-10-2022', end_date: '04-11-2022', city: 'Nairobi')
  end

  context 'valid' do
    it 'city to be valid' do
      subject.city.to eq 'Nairobi'
    end

    it 'date to be valid' do
      expect(subject.date).to eq '03-10-2022'
    end
  end

  context 'invalid' do
    it 'check the city is not blank' do
      subject.city = nil
      expect(subject).to_not be_valid
    end

    it 'check the date is not blank' do
      subject.date = nil
      expect(subject).to_not be_valid
    end
  end
end
