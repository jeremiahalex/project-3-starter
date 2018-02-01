class Warranty < ApplicationRecord
  belongs_to :customer, class_name: 'Account'
  belongs_to :product
  validates :product_id, uniqueness: true

end
