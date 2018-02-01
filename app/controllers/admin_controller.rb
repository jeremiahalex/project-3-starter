class AdminController < ApplicationController
  before_action :is_admin?
  skip_before_action :verify_authenticity_token

  def index
    @warranty_list = Warranty.all
    # render json: @warranty_list
  end
end
