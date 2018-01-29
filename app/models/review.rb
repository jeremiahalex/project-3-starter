class Review < ApplicationRecord
  belongs_to :space
  belongs_to :user

  validates :title, :review, presence: true
end
