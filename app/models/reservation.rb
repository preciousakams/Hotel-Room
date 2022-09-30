class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user, class_name: 'User', foreign_key: 'react_user_id'
end
