class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.integer :service_type
      t.string :description
      t.string :name
      t.float :price
      t.integer :slots_taken
      t.references :therapist

      t.timestamps
    end
  end
end
