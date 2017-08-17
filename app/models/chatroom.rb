class Chatroom < ApplicationRecord
  belongs_to :group

  has_many :messages
  has_many :users, through: :groups
end
