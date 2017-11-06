class Testimonial < ApplicationRecord
  belongs_to :tutor, :class_name => 'User'
  belongs_to :author, :class_name => 'User'
end
