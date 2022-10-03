require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'Reservation model' do
    user = User.create!(name: 'Test Person', email: 'test@test.com', password: '123456')
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
      it 'reservation to be valid' do
        expect(subject).to be_valid
      end

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

      it 'check if the city is not exceeding 50 characters' do
        subject.city = 'RandomCityRandomCityRandomCityRandomCityRandomCityRandomCityRandomCityRandomCityRandomCity'
        expect(subject).to_not be_valid
      end

      it 'check the date is not blank' do
        subject.date = nil
        expect(subject).to_not be_valid
      end

      it 'check if the date is not exceeding 20 characters' do
        subject.date = 'RandomDateRandomDateRandomDateRandomDateRandomDateRandomDateRandomDateRandomDateRandomDate'
        expect(subject).to_not be_valid
      end
    end
  end
end