require 'time'

class AccountController < ApplicationController
  before_action :authenticate_account!

  def index
    @ticket = Ticket.new
    # Get all the warranties registered under current customer
    @warranty_list = Warranty.where(customer_id: current_account.id)

    # Initialize an empty array to store retrieved warranty details of each product each in a hash
    @listings = Array.new

    # Loop through the list of warranties to extract the relevant product and warranty details for each product
    @warranty_list.each do |each|
      # Retrieve the product record using the `product_id`
      @product = Product.find(each.product_id)

      # Turn date string into a Ruby Date object
      @date_of_purchase = Date.parse(each.date_of_purchase.to_s)
      # Determine the expiry date from `warranty_in_months`
      @expiry_date = Date.parse((@date_of_purchase.in(@product.warranty_in_months.months) - 1.day).to_s)
      # Determine number of days left for warranty
      @warranty_left = (@expiry_date - Date.today).to_i

      @listing = Hash.new
      @listing[:warranty_id] = each.id
      @listing[:product_name] = @product.product_name
      @listing[:serial_no] = @product.serial_no
      @listing[:warranty_left] = @warranty_left
      @listing[:date_of_purchase] = @date_of_purchase.strftime("%-d %b %Y")
      @listing[:expiry_date] = @expiry_date.strftime("%-d %b %Y")

      @listings << @listing
    end

    @open_tickets = Ticket.where('customer_id = ?', current_account.id)
  end
end
