class CreateLoanStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :loan_statuses do |t|

      t.string "name"

      t.timestamps
    end
  end
end
