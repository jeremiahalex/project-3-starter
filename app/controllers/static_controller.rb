class StaticController < ApplicationController
  before_action :authenticate_user!, only: [:profile]

  def home
  end

  def about
  end

  def profile
  end

end
