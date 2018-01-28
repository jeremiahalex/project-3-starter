class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource)
    # Check if Admin
    if resource.is_a?(Account) && resource.is_admin?
      admin_index_path
    else
      # Customer
      account_index_path
    end
  end

  # Allow additional fields to go through devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      # Allow :first_name and :last_name in the edit_account_registration to be updated
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :current_password])
      # Allow :first_name and :last_name in the new_account_registration to be updated
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password])
    end
end
