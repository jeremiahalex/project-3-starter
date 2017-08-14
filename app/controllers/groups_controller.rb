class GroupsController < ApplicationController

  def new
    @new_group = current_user.groups.new
    # render json: current_user.groups
    @current_deal = Deal.find(params[:deal_id])
    # render json: Deal.find(params[:deal_id])
    @current_restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create

    creating_group = params.require(:group).permit(:pax, :date, :time)

    creating_group[:deal_id] = params[:deal_id]

    Group.create(creating_group)

    redirect_to root_path

    # render json: params
  end

end
