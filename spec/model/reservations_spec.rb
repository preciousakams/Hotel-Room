require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.describe Reservation, type: :model do
  before :each do
    @user = User.create(name: 'John')
    @room = Room.new(
      name: 'Deluxe, Guest room',
      description: 'Deluxe, Guest room, 1 King. Sleep soundly in Bodrum on the indulgent bedding and crisp linens in all of our resort hotel rooms',
      size: '45',
      view: 'Sea',
      bedding: 'Twin',
      image: 'https://cache.marriott.com/content/dam/marriott-renditions/BJVEB/bjveb-deluxe-0003-hor-wide.jpg?output-quality=70&interpolation=progressive-bilinear&downsize=1336px')
  end
  context 'validations' do
    it 'should be valid with valid attributes' do
      @reservation = Reservation.new(name: @user.name, room: @room.name,
                                     end_date: Date.today + 1.day, city: 'Nairobi')

      @reservation.save
      expect(@reservation).to be_valid
    end

    it 'should be invalid without a user' do
      @reservation = Reservation.new(name: nil, room: @room.name,
                                     end_date: Date.today + 1.day, city: 'Nairobi')
      @reservation.save
      expect(@reservation).to_not be_valid
    end

    it 'should be invalid without a room' do
      @reservation = Reservation.new(name: @user.name, room: nil, start_date: Date.today,
                                     end_date: Date.today + 1.day)
      @reservation.save
      expect(@reservation).to_not be_valid
    end

    it 'should be invalid without a start date' do
      @reservation = Reservation.new(user_id: @user.id, room: @room.id, start_date: nil,
                                     end_date: Date.today + 1.day)
      @reservation.save
      expect(@reservation).to_not be_valid
    end

    it 'should be invalid without an end date' do
      @reservation = Reservation.new(user_id: @user.name, motorcycle_id: @room.name, start_date: Date.today,
                                     end_date: nil)
      @reservation.save
      expect(@reservation).to_not be_valid
    end

    it 'should be invalid without a city' do
      @reservation = Reservation.new(user_id: @user.name, motorcycle_id: @room.name, start_date: Date.today,
                                     end_date: Date.today + 1.day, city: nil)
      @reservation.save
      expect(@reservation).to_not be_valid
    end
  end
  context 'associations' do
    it 'belongs to user' do
      associate = described_class.reflect_on_association(:user)
      expect(associate.macro).to eq :belongs_to
    end
    it 'belongs to motorcycle' do
      associate = described_class.reflect_on_association(:motorcycle)
      expect(associate.macro).to eq :belongs_to
    end
  end
end
# rubocop:enable Metrics/BlockLength
