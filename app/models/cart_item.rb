class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :clothes_set, optional: true


  def checkout_item
    @current_cart_item = CartItem.find(self.id)
    @current_user= User.find(@current_cart_item.user_id)
    @new_loaned_item = @current_user.loaned_item.new(clothes_set_id: @current_cart_item.clothes_set_id, loan_status_id: 1)
    @new_loaned_item.save
    @selected_clothes_set = ClothesSet.find(@current_cart_item.clothes_set_id)
    @selected_clothes_set.change_status(2)
    CartItem.destroy(self.id)
  end

end
