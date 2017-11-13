class LoanedItem < ApplicationRecord
  belongs_to :user
  belongs_to :clothes_set
  belongs_to :loan_status

  scope :loan_status_values,-> (loan_status_id) { where(loan_status_id: loan_status_id)}
  scope :not_completed,-> (user_id) do
    where(user_id: user_id).where.not(loan_status_id: 4)
  end
  scope :completed,-> (user_id) do
    where user_id: user_id, loan_status_id: 4
  end

end
