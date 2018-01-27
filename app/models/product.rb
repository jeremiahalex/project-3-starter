class Product < ApplicationRecord
  belongs_to :space, dependent: :destroy

  mount_uploader :image_url, ImageUploader

end
