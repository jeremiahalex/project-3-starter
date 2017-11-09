class CartItem < ApplicationRecord
  has_many :user
  has_many :clothes_set
end
