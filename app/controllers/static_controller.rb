class StaticController < ApplicationController
  before_action :authenticate_user!, only: [:profile]

  def home
    @deals = Deal.all
    # render json: @restaurants.find(12)
  end

  def about
  end

  def profile
  end

end
