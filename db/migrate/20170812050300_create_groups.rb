class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.integer :pax
      t.string :time
      t.date :date
      t.references :deal, foreign_key: true

      t.timestamps
    end
  end
end
