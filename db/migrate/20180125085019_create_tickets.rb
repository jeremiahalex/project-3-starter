class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.date :date_created
      t.string :title
      t.text :body
      t.boolean :is_resolved
      t.date :date_resolved
      t.references :customer, foreign_key: { to_table: :accounts }
      t.references :warranty, foreign_key: true
      t.references :staff, foreign_key: { to_table: :accounts }

      t.timestamps
    end
  end
end
