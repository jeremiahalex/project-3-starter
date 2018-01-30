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
    #
    # if account_signed_in?

  end

  def create
    @new_warranty = Warranty.new(permit_warranty_params)
    @new_warranty.product_id = params[:product][:id]
    message_hash = {}
    # ------Check if user is signed in------
    if account_signed_in?
      @new_warranty.customer_id = current_account.id
      @new_warranty.save
      message_hash = {:notice => "Product Registered. Kindly Check Your Email For Confirmation."}
    else
      # ------Check for any errors with account creation------
      # params[:account][:password] = Devise.friendly_token.first(12)
      new_account = Account.new(permit_account_params)
      if ! new_account.validate
        # return render json: new_account.errors.messages
        flash.now[:alert] = new_account.errors.messages
        return render :new
      else
        @new_account.save
        @new_warranty.customer_id = new_account.id
        @new_warranty.save
        message_hash = {:notice => "Account Created & Product Registered. Kindly Check Your Email For Confirmation."}
      end
    end
    redirect_to root_path, message_hash
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
