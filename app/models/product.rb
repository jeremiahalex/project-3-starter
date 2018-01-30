class Product < ApplicationRecord
  has_many :warranties
  validates :serial_no, uniqueness: true
end
