class CartController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: :index

  def index
    @all_cart_item = current_user.cart_item
    @selected_item = []
  end

  def create
    @user_id = current_user.id
    @clothes_set_id = params[:clothes_set_id]
    @current_clothes_set = ClothesSet.find(@clothes_set_id)
    @current_clothes_set.add_to_cart(@user_id)
  end

  def new

  end

  def show
    @cart_items = CartItem.find(params[:id])
  end

  def edit
    @cart_items = CartItem.find(params[:id])
  end

  def destroy
    CartItem.destroy(params[:id])
    # redirect_to '/browse'
  end

  def checkout
    current_user.create_loaned_item
    redirect_to '/loaned_item'
  end


end
