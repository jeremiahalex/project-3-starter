class Group < ApplicationRecord
  belongs_to :deal

  has_and_belongs_to_many :users

  has_one :restaurant, through: :deal
end
