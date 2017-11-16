class ProfileController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: :show

  def show
  end

end
