class Lesson < ApplicationRecord
  belongs_to :tutor, class_name: 'User'
  has_one :booking

  def self.search(language_taught,price)
    return Lesson.all unless language_taught.present? || price.present?
    if language_taught && price.blank?
      where('language_taught = ?', "#{language_taught}")
    elsif price && language_taught.blank?
      where('price = ?', "#{price}")
    else
      where(['language_taught = ? AND price = ?', "#{language_taught}","#{price}"])
    end
end
end
