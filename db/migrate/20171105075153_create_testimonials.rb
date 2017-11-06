class CreateTestimonials < ActiveRecord::Migration[5.1]
  def change
    create_table :testimonials do |t|
      t.string :title
      t.text :review
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
