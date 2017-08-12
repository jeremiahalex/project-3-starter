class Deal < ApplicationRecord
  belongs_to :restaurant

  has_many :groups
end
