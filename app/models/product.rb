class Product < ApplicationRecord
  belongs_to :space, dependent: :destroy
<<<<<<< HEAD
=======

  mount_uploader :image_url, ImageUploader

>>>>>>> dev
end
