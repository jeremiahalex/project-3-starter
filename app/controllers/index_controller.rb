class IndexController < ApplicationController
  def index
  end

  def catch_404
    flash[:alert] = "404 Not Found"
    redirect_to root_path
  end
end
