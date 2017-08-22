class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :groups
  has_many :deals, through: :groups
  has_many :restaurants, through: :deals
  has_many :chatrooms, through: :groups
  has_many :messages
end
