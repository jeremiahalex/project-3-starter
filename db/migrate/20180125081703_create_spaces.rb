class CreateSpaces < ActiveRecord::Migration[5.1]
  def change
    create_table :spaces do |t|
      t.string :company_name
      t.string :address
      t.text :summary
      t.text :description
      t.string :contact
      t.string :image_url
      t.boolean :is_active
      t.boolean :is_rejected

      t.timestamps
    end

  end
end
