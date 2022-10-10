require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before :all do
    @user = User.create(email: 'test@test.com', name: 'Test', username: 'test')
    @room = Room.create(name: 'Deluxe, Guest room', description: 'Deluxe, Guest room, 1 King. Sleep soundly in Bodrum on the indulgent bedding and crisp linens in all of our resort hotel rooms', size: '45', view: 'Sea', bedding: 'Twin', image: 'https://cache.marriott.com/content/dam/marriott-renditions/BJVEB/bjveb-deluxe-0003-hor-wide.jpg?output-quality=70&interpolation=progressive-bilinear&downsize=1336px')
    @reservation = Reservation.new(user_id: @user.id, car_id: @room.id, date: '2022-10-11', city: 'test')
  end

  it 'is valid' do
    expect(@reservation).to be_valid
  end

  it 'date should be present' do
    @reservation.date = nil
    expect(@reservation).to_not be_valid
  end

  it 'city should be present' do
    @reservation.city = nil
    expect(@reservation).to_not be_valid
  end
end
