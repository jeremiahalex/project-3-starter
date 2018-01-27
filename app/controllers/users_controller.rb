class UsersController < ApplicationController
  def show
    # === setting default space of 13 ===
    # @space = Space.find(13)
    @space = User.find(params[:id]).space
    @website = @space.website
    @product = Product.new
    @products = @space.products

  end

  def update
    #code
  end

end
