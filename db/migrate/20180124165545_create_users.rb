class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :username
      t.boolean :is_admin
      t.boolean :is_owner
      t.timestamps
    end
  end
end
