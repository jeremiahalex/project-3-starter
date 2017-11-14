class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :student
      t.references :lesson, foreign_key: true

      t.timestamps
    end
    add_foreign_key :bookings, :users, column: :student_id, primary_key: :id
  end
end
