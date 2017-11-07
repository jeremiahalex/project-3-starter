class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string "name"
      t.string "email"
      t.string "password"
      t.string "address"
      t.integer "phone_number"
      t.string "subscription_status"
      t.integer "points"
      t.boolean "admin?"

      t.timestamps
    end
  end
end
