class CreateJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :items, :events do |t|
      t.index :item_id #fk from post
      t.index :event_id #fk from tag
    end
  end
end
