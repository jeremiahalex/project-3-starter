class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.timestamp :datetime
      t.references :tutor
      t.integer :duration
      t.integer :price
      t.string :venue
      t.string :language_taught

      t.timestamps
    end
    add_foreign_key :lessons, :users, column: :tutor_id, primary_key: :id
  end
end
