class Ticket < ApplicationRecord
  belongs_to :warranty
  belongs_to :customer, class_name: 'Account'
  belongs_to :staff, class_name: 'Account'
end
