class Lesson < ApplicationRecord
  belongs_to :tutor, :class_name => 'User'

  def self.search(language_taught)
  if language_taught
    where('name LIKE ?', "%#{language_taught}%")
  else
    all
  end
end
end
