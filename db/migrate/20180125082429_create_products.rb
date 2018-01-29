class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :model_no
      t.string :serial_no, unique: true
      t.integer :warranty_in_months

      t.timestamps
    end
    add_index :products, :serial_no, unique: true
  end
end
