class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.string :imageUrl
      t.string :product_details_url
      t.timestamps
    end
  end
end
