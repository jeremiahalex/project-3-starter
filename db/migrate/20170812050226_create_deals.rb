class CreateDeals < ActiveRecord::Migration[5.1]
  def change
    create_table :deals do |t|
      t.string :name
      t.text :description
      t.integer :pax
      t.text :img
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
