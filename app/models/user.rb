class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :skills
  has_many :languages, through: :skills

  has_many :sessions, :foreign_key => 'tutor_id'
  has_many :bookings, through: :sessions

  has_many :testimonials, :foreign_key => 'tutor_id'
  has_many :testimonials, :foreign_key => 'author_id'
end
