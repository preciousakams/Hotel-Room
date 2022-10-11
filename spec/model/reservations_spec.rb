require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before :all do
    @user = User.new(name: 'Johnny')
    @room = Room.new(name: 'Deluxe, Guest room', description: 'Deluxe, Guest room, 1 King. Sleep soundly in Bodrum on the indulgent bedding and crisp linens in all of our resort hotel rooms', size: '45', view: 'Sea', bedding: 'Twin', image: 'https://cache.marriott.com/content/dam/marriott-renditions/BJVEB/bjveb-deluxe-0003-hor-wide.jpg?output-quality=70&interpolation=progressive-bilinear&downsize=1336px')
    @reservation = Reservation.new(user_id: @user.name, room_id: @room.name, date: '03-10-2022', city: 'Nairobi')
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

  context 'valid' do
    it 'check the city is valid' do
      expect(@reservation.city).to eq 'Nairobi'
    end
    it 'check if the date is valid' do
      expect(@reservation.date).to eq '03-10-2022'
    end
    it 'check if name is valid' do
      expect(@user.name).to eq 'Johnny'
    end
  end
end
