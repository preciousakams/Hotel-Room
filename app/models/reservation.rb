class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :city, presence: true
  validates :date, presence: true
end
