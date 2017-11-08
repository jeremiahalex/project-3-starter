class CreateChildren < ActiveRecord::Migration[5.1]
  def change
    create_table :children do |t|
      t.string "name"
      t.string "gender"
      t.date "birthday"
      t.string :size, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
