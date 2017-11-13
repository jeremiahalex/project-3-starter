class Child < ApplicationRecord
  belongs_to :user
  belongs_to :size

  def change_size(size_id)
    @child = Child.find(self.id)
    @child.update(size_id: size_id )
  end

end
