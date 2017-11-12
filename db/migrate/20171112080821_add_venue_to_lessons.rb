class AddVenueToLessons < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :venue, :string
    add_column :lessons, :language_taught, :string
  end
end
