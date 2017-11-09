class LoanedItem < ApplicationRecord
  has_many :user
  has_many :clothes_set
  belongs_to :loan_status
end
