class GroupsController < ApplicationController
  def show_current_user
    render json: current_user.groups
  end

  def show_restaurant_on_profile
    render json: params
  end
end
