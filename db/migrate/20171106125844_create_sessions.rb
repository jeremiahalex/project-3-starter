class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
      t.timestamp :datetime
      t.references :tutor
      t.integer :duration
      t.integer :price

      t.timestamps
    end
    add_foreign_key :sessions, :users, column: :tutor_id, primary_key: :id
  end
end
