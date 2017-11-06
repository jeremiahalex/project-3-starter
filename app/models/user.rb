class User < ApplicationRecord
  has_many :skills
  has_many :languages, through: :skills

end
