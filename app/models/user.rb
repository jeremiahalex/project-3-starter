class User < ApplicationRecord
  has_many :skills
  has_many :languages, through: :skills

  has_many :testimonials, :class_name => 'testimonials', :foreign_key => 'tutor_id'
  has_many :testimonials, :class_name => 'testimonials', :foreign_key => 'author_id'
end
