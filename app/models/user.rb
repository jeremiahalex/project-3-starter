class User < ApplicationRecord
  has_many :skills
  has_many :languages, through: :skills

  has_many :interests
  has_many :languages, through: :interests

  has_many :bookings, :class_name => 'bookings', :foreign_key => 'tutor_id'
  has_many :bookings, :class_name => 'bookings', :foreign_key => 'student_id'
end
