require 'time'
class AccountController < ApplicationController
  before_action :authenticate_account!
  def index
    @warranty_list = Warranty.where(customer_id: current_account.id)
    @listings = []
    @warranty_list.each do |each|
      @product = Product.find(each.product_id)

      @date_of_purchase = Date.parse(each.date_of_purchase.to_s)
      @expiry_date = Date.parse((@date_of_purchase.in(1.year) - 1.day).to_s)
      @warranty_left = (@expiry_date - Date.today).to_i

      @listing = Hash.new
      @listing[:product_name] = @product.product_name
      @listing[:serial_no] = @product.serial_no
      @listing[:warranty_left] = @warranty_left
      @listing[:date_of_purchase] = @date_of_purchase
      @listing[:expiry_date] = @expiry_date

      @listings << @listing
    end
    # render json: @listings
    @listings
  end
end
