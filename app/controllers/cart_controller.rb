class CartController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: :index

  def index
    @all_cart_item = current_user.cart_item
  end

  def create
    @user_id = current_user.id
    @clothes_set_id = params[:clothes_set_id]
    @current_clothes_set = ClothesSet.find(@clothes_set_id)
    @current_clothes_set.add_to_cart(@user_id)
    current_user.remove_point(@current_clothes_set.points)
  end

  def destroy
    CartItem.destroy(params[:id])
    current_user.add_point(10)
  end

  def checkout
    @all_cart_item = current_user.cart_item
    not_available = []
    @all_cart_item.each do |item|
      @selected_clothes_set = ClothesSet.find(item.clothes_set_id)
      if @selected_clothes_set.stock_status_id != 1
        not_available <<  @selected_clothes_set.name
        CartItem.destroy(item.id)
      end
    end

    if not_available.length == 0
      current_user.create_loaned_item
      flash[:notice] = "Your request have been submited. Have a nice day"
      redirect_to '/my_order'
    else
      points_to_add_back = not_available.length * 10
      flash[:notice] = "Sorry. #{not_available.to_sentence } is currently unavailable"
      current_user.add_point(points_to_add_back)
      redirect_to '/cart'
    end


  end

end
