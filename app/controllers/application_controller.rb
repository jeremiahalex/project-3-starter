class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :street, :unit, :postalcode])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :street, :unit, :postalcode])
  end

  private

  def has_child
    unless current_user.child[0].present?
      flash[:notice] = "Please enter your child information first"
      redirect_to profile_children_new_path
    end
  end

end
