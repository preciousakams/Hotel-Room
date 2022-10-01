require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  describe 'Reservation model' do
    user = User.create!(name: 'Felix', email: 'felix@example.com', password: '123456')
    room = Room.create!(
      name: '',
      description: '',
      size: '',
      view: '',
      bedding: '',
      image: ''
    )

    subject { Reservation.new(user_id: user.id, room_id: room.id, city: 'Pukhet, Thailand', date: '01-10-2022') }
    before { subject.save! }

    context 'valid' do
      it 'reservation to be valid' do
        expect(subject).to be_valid
      end
      it 'city to be valid' do
        expect(subject.city).to eq 'Pukhet, Thailand'
      end
      it 'date to be valid' do
        expect(subject.date).to eq '01-10-2022'
      end
    end

    context 'invalid' do
      it 'check if the city is blank' do
        subject.city = nil
        expect(subject).to_not be_valid
      end
      it 'check if the city does not exceed 50 characters' do
        subject.city = 'RandomCityRandomCityRandomCityRandomCityRandomCityRandomCityRandomCityRandomCityRandomCity'
        expect(subject).to_not be_valid
      end
      it 'check if the date is blank' do
        subject.date = nil
        expect(subject).to_not be_valid
      end
      it 'check if the date exceeds 20 characters' do
        subject.date = 'RandomDateRandomDateRandomDateRandomDateRandomDateRandomDateRandomDateRandomDateRandomDate'
        expect(subject).to_not be_valid
      end
    end
  end
end
