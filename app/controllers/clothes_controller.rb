class ClothesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def destroy
    @clothes_set = ClothesSet.find(params[:id])
    cart_item_id = @clothes_set.cart_id(current_user.id)
    CartItem.destroy(cart_item_id)
    current_user.add_point(@clothes_set.points)
  end
  
end
