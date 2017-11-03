class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.time :time
      t.date :date
      t.text :venue

      t.timestamps
    end
  end
end
