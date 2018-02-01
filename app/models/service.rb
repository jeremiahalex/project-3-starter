class Service < ApplicationRecord
  belongs_to :therapist
  has_one :booking


end
