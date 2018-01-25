class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :model_no
      t.string :serial_no
      t.integer :warranty_in_months

      t.timestamps
    end
  end
end
