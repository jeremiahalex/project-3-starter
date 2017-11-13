class AddColumnsToLessons < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :name, :string
    add_column :lessons, :details, :text
  end
end
