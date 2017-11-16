class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :child
  has_many :cart_item
  has_many :loaned_item
  # has_many :clothes_set, through: :cart_items
  has_many :clothes_set, through: :loaned_item

  def remove_point(amt)
    @current_user = User.find(self.id)
    @current_user.points -= amt
    @current_user.save
  end

  def add_point(amt)  
    @current_user = User.find(self.id)
    @current_user.points += amt
    @current_user.save
  end

  def create_loaned_item
    @current_user = User.find(self.id)
    @all_cart_item = @current_user.cart_item
    @all_cart_item.each do |item|
      @new_loaned_item = LoanedItem.new(user_id: self.id, clothes_set_id: item.clothes_set_id, loan_status_id: 1)
      @new_loaned_item.save
      @selected_clothes_set = ClothesSet.find(item.clothes_set_id)
      @selected_clothes_set.change_status(2)
      CartItem.destroy(item.id)
    end
  end

end
