require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      room = Room.new(name: 'Deluxe, Guest room', description: 'Deluxe, Guest room, 1 King. Sleep soundly in Bodrum on the indulgent bedding and crisp linens in all of our resort hotel rooms', size: '45', view: 'Sea', bedding: 'Twin', image: 'https://cache.marriott.com/content/dam/marriott-renditions/BJVEB/bjveb-deluxe-0003-hor-wide.jpg?output-quality=70&interpolation=progressive-bilinear&downsize=1336px')
      expect(room).to be_valid
    end
    it 'is not valid without a name' do
      room = Room.new(name: nil)
      expect(room).to_not be_valid
    end
    it 'is not valid without a description' do
      room = Room.new(description: nil)
      expect(room).to_not be_valid
    end
    it 'is not valid without a size' do
      room = Room.new(size: nil)
      expect(room).to_not be_valid
    end
    it 'is not valid without a view' do
      room = Room.new(view: nil)
      expect(room).to_not be_valid
    end
    it 'is not valid without a bedding' do
      room = Room.new(bedding: nil)
      expect(room).to_not be_valid
    end
    it 'is not valid without a image' do
      room = Room.new(image: nil)
      expect(room).to_not be_valid
    end
  end
  describe 'Associations' do
    it 'has many reservations' do
      assc = described_class.reflect_on_association(:reservations)
      expect(assc.macro).to eq :has_many
    end
  end
end
