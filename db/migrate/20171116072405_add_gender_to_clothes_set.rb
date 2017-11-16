class AddGenderToClothesSet < ActiveRecord::Migration[5.1]

  def change
    add_column :clothes_sets, :gender, :integer
  end

end
