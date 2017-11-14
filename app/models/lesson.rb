class Lesson < ApplicationRecord
  belongs_to :tutor, :class_name => 'User'
  has_one :booking
end
