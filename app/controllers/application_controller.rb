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
end
