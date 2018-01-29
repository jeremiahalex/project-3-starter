class Product < ApplicationRecord
  belongs_to :space

  mount_uploader :image_url, ImageUploader

end
