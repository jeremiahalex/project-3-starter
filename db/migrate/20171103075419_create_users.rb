class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.text :name
      t.string :email
      t.string :photo
      t.string :password
      t.text :description
      t.string :gender
      t.text :past_experience
      t.string :github
      t.text :available_timings
      t.float :rating

      t.timestamps
    end
  end
end
