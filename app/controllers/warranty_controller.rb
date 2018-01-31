class WarrantyController < ApplicationController

  def index
  end

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

  end

  def create
    @new_warranty = Warranty.new(permit_warranty_params)
    @new_warranty.product_id = params[:product][:id]
    message_hash = {}
    if account_signed_in?
      # ------Check if user is signed in------
      acc_id_for_warranty = current_account.id
    else
      # ------Create new user------
      new_account = Account.new(permit_account_params)
      # ------Check for any errors with account creation------
      if ! new_account.validate
        flash[:alert] =  array_to_flash(new_account.errors.full_messages)
        return redirect_to(request.env['HTTP_REFERER'])
      else
        new_account.save
        acc_id_for_warranty = new_account.id
      end
    end
    # ------Create new warranty------
    @new_warranty.customer_id = acc_id_for_warranty
    if ! @new_warranty.validate
      flash[:alert] = array_to_flash(@new_warranty.errors.full_messages)
      return redirect_to(request.env['HTTP_REFERER'])
    else
      @new_warranty.save
      message_hash = {:notice => "Product Registered. Kindly Check Your Email For Confirmation."}
    end
    redirect_to root_path, message_hash
  end

  private

  # Method to convert errors messages in hash to flash
  def array_to_flash(full_msg)
    return_string = ''
    if full_msg.kind_of?(Array)
      if ! full_msg.empty?
        full_msg.each { |x| return_string += x.to_s + '<br>' }
      end
    end
    return_string.gsub(/[\'\"\[\]]/, '')
  end

  # Permit Params
  def permit_account_params
    params.require(:account).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def permit_warranty_params
    params.require(:warranty).permit(:date_of_purchase, :product_id, :customer_id)
  end

  # Methods for Devise Account Creation
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
