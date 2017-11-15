class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :lessons , :foreign_key => 'tutor_id'
  has_many :bookings, through: :lessons


  has_uploadcare_file :photo
end
