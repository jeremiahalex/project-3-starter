class ClothesController < ApplicationController

  def index
    @child = current_user.child[0]
    @styles = Style.all
    clothes_size_id = params['size']
    clothes_style_id = params['style']
    @filtered_clothes = ClothesSet.in_stock_size_style(clothes_size_id, clothes_style_id)
    # render json: @filtered_clothes
  end

end
