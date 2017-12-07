class BrowseController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!
  before_action :has_child
  
  def index
    @styles = Style.all
    clothes_size_name = params['size']
    clothes_size_id = Size.find_by(name: clothes_size_name)
    @clothes_style = params['style']
    clothes_style_id = Style.find_by(name: @clothes_style )
    gender = params['gender']
    @filtered_clothes = ClothesSet.in_stock_size_style(clothes_size_id, clothes_style_id, gender)
  end

end
