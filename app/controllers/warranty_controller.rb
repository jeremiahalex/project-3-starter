class WarrantyController < ApplicationController
  def new
    # @products = Product.all.to_ary
    # Create new Warranty Product
    @new_warranty = Warranty.new
    # # Find product from URL query
    product_id = params[:psn]
    return redirect_to root_path, :alert => "Use QR Code for registration" if product_id.nil?
    product = Product.find_by(serial_no: product_id)
    return redirect_to root_path, :alert => "Serial Number not Found" if product.nil?
    @new_warranty.product = product
    #
    # if account_signed_in?

  end

  def create
    if account_signed_in?


    else
      params[:account][:password] = Devise.friendly_token.first(12)
      new_account = Account.create!(permit_account_params)
      new_warranty = Warranty.new(permit_warranty_params)
      new_warranty.product_id = params[:product][:id]
      new_warranty.customer_id = new_account.id
      new_warranty.save
      return redirect_to root_path, :notice => "Product Registered. Kindly Check Your Email For Confirmation."
    end
  end

  private

  def permit_account_params
    params.require(:account).permit(:first_name, :last_name, :email, :password)
  end

  def permit_warranty_params
    params.require(:warranty).permit(:date_of_purchase, :product_id, :customer_id)
  end

  def resource_name
    :account
  end
  helper_method :resource_name

  def resource
    @resource ||= Account.new
  end
  helper_method :resource

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:account]
  end
  helper_method :devise_mapping

  def resource_class
    Account
  end
  helper_method :resource_class

end
