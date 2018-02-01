class AddFkToSpaces < ActiveRecord::Migration[5.1]
  def change
    add_reference :spaces, :category, foreign_key: true
    add_reference :spaces, :user, foreign_key: true
    add_reference :spaces, :website, foreign_key: true
  end
end
