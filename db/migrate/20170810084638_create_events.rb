class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.date :date
      t.time :time
      t.string :type
      t.integer :budget
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
