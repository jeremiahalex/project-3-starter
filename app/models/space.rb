class Space < ApplicationRecord
  belongs_to :category
  belongs_to :website, dependent: :destroy
  belongs_to :user

  has_many :bookmarks
  has_many :reviews
  has_many :products

  # mount_uploader :image_url, ImageUploader

  validates :company_name, :summary, :category_id, :contact, :address, :description, presence: true
  validates :contact, numericality: true

end
