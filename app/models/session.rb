class Session < ApplicationRecord
  belongs_to :tutor, :class_name => 'User'
end
