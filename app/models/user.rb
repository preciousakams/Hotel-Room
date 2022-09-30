class User < ApplicationRecord
  has_many :reservations
  has_many :rooms, through: :reservations, dependent: :destroy
end
