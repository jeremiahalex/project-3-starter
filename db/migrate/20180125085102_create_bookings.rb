class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :user
      t.references :service
      t.date :date
      t.integer :time
      t.string :reference_number

      t.timestamps
    end
  end
end
