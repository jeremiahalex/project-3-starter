class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.string :name
            t.time :time
            t.date :date
            t.text :venue
            t.references :tutor
            t.references :student
            t.timestamps
          end
          add_foreign_key :bookings, :users, column: :tutor_id, primary_key: :id
          add_foreign_key :bookings, :users, column: :student_id, primary_key: :id
  end
end
