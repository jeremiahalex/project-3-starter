class ClothesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: :index

  def index
    @child = current_user.child[0]
    @styles = Style.all
    @clothes_size_id = params['size']
    @clothes_style_id = params['style']
    @filtered_clothes = ClothesSet.in_stock_size_style(@clothes_size_id, @clothes_style_id)
    # render json: @filtered_clothes
  end

  def destroy
    @clothes_set = ClothesSet.find(params[:id])
    cart_item_id = @clothes_set.cart_id(current_user.id)
    CartItem.destroy(cart_item_id)
    current_user.add_point(@clothes_set.points)
  end
end
