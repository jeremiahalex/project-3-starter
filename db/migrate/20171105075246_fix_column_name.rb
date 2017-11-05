class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :testimonials, :user_id, :author
  end
end
