class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :skills
  has_many :languages, through: :skills


  has_many :lessons
  has_many :bookings, through: :lessons


  has_uploadcare_file :photo
end
