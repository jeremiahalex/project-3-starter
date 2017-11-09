class ClothesSet < ApplicationRecord
  belongs_to :size
  belongs_to :stock_status
  belongs_to :style
end
