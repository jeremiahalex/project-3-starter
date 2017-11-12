class CreateCartItems < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_items do |t|
      t.references :user, foreign_key: true
      t.references :clothes_set, foreign_key: true

      t.timestamps
    end
  end
end
