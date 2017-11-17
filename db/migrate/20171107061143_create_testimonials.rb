class CreateTestimonials < ActiveRecord::Migration[5.1]
  def change
    create_table :testimonials do |t|
      t.string :title
      t.text :content
      t.references :tutor
      t.references :author

      t.timestamps
    end
    add_foreign_key :testimonials, :users, column: :tutor_id, primary_key: :id
    add_foreign_key :testimonials, :users, column: :author_id, primary_key: :id
  end
end
