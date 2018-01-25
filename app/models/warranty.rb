class Warranty < ApplicationRecord
  belongs_to :customer, class_name: 'Account'
  belongs_to :product
end
