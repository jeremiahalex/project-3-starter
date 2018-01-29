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
    # @new_warranty.product = product
    #
    # if account_signed_in?

  end

  def create
    # new_account = Account.new(create_acc_params)
    # new_account.save
    # redirect_to root_path
  end

  protected

  def configure_permitted_parameters
    # Allow :first_name and :last_name in the new_account_registration to be updated
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email])
  end

  def create_acc_params
    params.require(:account).permit(:first_name, :last_name, :email)
  end

  private

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
