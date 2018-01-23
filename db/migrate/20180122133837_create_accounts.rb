class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :facebook_token
      t.boolean :is_active

      t.timestamps
    end
  end
end
