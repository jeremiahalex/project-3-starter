class Lesson < ApplicationRecord
  belongs_to :tutor, :class_name => 'User'
end
