class Space < ApplicationRecord
  belongs_to :category, dependent: :destroy
end
