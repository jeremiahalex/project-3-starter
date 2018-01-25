class CreateSites < ActiveRecord::Migration[5.1]
  def change
    create_table :sites do |t|
      t.string :website
      t.string :facebook
      t.string :instagram
      t.string :googleplus
      t.string :linkedin

      t.timestamps
    end
  end
end
