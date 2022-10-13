require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      user = User.new(name: 'John')
      expect(user).to be_valid
    end
    it 'is not valid without a name' do
      user = User.new(name: nil)
      expect(user).to_not be_valid
    end
    describe 'Associations' do
      it 'has many reservations' do
        assc = described_class.reflect_on_association(:reservations)
        expect(assc.macro).to eq :has_many
      end
      it 'has many rooms' do
        assc = described_class.reflect_on_association(:rooms)
        expect(assc.macro).to eq :has_many
      end
    end
  end
end
