class UsersController < ApplicationController
  def show
    #code
    @space = Space.first
    @website = @space.website
    @product = Product.new
    @products = Space.find(13).products
  end

  def update
    #code
  end

end
