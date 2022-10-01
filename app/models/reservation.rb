class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :date, presence: true, length: { in: 1..20 }
end
