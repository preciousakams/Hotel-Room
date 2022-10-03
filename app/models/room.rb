class Room < ApplicationRecord
  has_many :reservations

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :size, presence: true, numericality: { only_integer: true }
  validates :view, :bedding, :image, presence: true
end
