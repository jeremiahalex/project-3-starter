class Language < ApplicationRecord
  has_many :skills
  has_many :users, through: :skills

  has_many :interests
  has_many :users, through: :interests
end
