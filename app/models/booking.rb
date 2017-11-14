class Booking < ApplicationRecord
  belongs_to :student, :class_name => 'User'
  has_one :lesson
end
