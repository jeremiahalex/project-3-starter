class CreateClothesSets < ActiveRecord::Migration[5.1]
  def change
    create_table :clothes_sets do |t|
      t.string "name"
      t.references :style, foreign_key: true
      t.references :size, foreign_key: true
      t.references :stock_status, foreign_key: true
      t.string "photo_URL"
      t.integer "points", default: 10
      t.timestamps
    end
  end
end
