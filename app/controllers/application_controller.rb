class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permit, if: :devise_controller?
  before_action :category

  def category
    @category = Category.all
  end

  protected

  def configure_permit
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username, :is_admin, :is_owner])
  end

end
