class Group < ApplicationRecord
  belongs_to :deal

  has_and_belongs_to_many :users
end
