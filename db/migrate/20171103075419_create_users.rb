class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.text :name
      t.string :email
      t.string :password
      t.string :photo
      t.string :gender
      t.boolean :reg_tutor, default: false
      t.text :past_experience
      t.string :github

      t.timestamps
    end
  end
end
