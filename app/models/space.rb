class Space < ApplicationRecord
  belongs_to :category, dependent: :destroy
  belongs_to :website, dependent: :destroy
  belongs_to :user, dependent: :destroy

  has_many :products
  has_many :reviews
end
