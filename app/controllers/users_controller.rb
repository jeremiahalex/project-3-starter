class UsersController < ApplicationController
  def show
    #code
    @space = User.find(params[:id]).space
    @website = @space.website
    @product = Product.new
    @products = @space.products


  end

  def update
    #code
  end

end
