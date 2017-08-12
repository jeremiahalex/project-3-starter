class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.integer :pax
      t.date :date
      t.time :time
      t.references :deal, foreign_key: true

      t.timestamps
    end
  end
end
