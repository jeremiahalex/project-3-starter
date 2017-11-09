class Size < ApplicationRecord
  has_many :child
  has_many :clothes_set
end
