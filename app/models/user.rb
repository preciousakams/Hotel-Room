class User < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :rooms, through: :reservations, dependent: :destroy
end
