class StaticController < ApplicationController
  before_action :authenticate_user!, only: [:profile]

  def home
    @deals = Deal.all
    # render json: @deals
  end

  def about
  end

  def profile
  end

end
