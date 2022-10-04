require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'Reservation model' do
    user = User.create!(name: 'Test Person')
    room = Room.create!(
      name: 'Deluxe, Guest Room',
      description: 'Deluxe, Guest room, 1 King. Sleep soundly in Bodrum on the indulgent bedding and crisp linens in all of our resort hotel rooms',
      size: '45',
      view: 'Sea',
      bedding: 'twin',
      image: 'a'
    )
    subject { Reservation.new(user_id: user.id, room_id: room.id, city: 'Turkey', date: '03-10-2022') }
    before { subject.save! }

    context 'valid' do
      it 'city to be valid' do
        expect(subject.city).to eq 'Turkey'
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
end
