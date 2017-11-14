class Lesson < ApplicationRecord
  belongs_to :tutor, class_name: 'User'
  has_one :booking

  def self.search(language_taught)
    if language_taught
      where('name LIKE ?', "%#{language_taught}%")
    else
      all
    end
end
end
