class CreateWarranties < ActiveRecord::Migration[5.1]
  def change
    create_table :warranties do |t|
      t.date :date_of_purchase
      t.references :customer, foreign_key: { to_table: :accounts }
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
