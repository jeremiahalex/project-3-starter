class CreateLoanedItems < ActiveRecord::Migration[5.1]
  def change
    create_table :loaned_items do |t|
      t.references :user, foreign_key: true
      t.references :clothes_sets, foreign_key: true
      t.references :loan_status, foreign_key: true
      t.date :date_of_submission
      t.timestamps
    end
  end
end
