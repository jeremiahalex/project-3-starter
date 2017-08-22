class Restaurant < ApplicationRecord
  has_many :deals

  def self.search(search)
  where("name ILIKE ?", "%#{search}%")
  end
end
