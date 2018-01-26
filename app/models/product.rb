class Product < ApplicationRecord
  belongs_to :space, dependent: :destroy
end
