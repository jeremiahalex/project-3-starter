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

  def index
    render html: 'show all groups within deals page'
  end

  def show
    @group = Group.find(params[:id])
  end

  def update
    update_group = Group.find(params[:id])
    update_group.users << current_user

    redirect_to restaurant_deal_group_path
  end

  def destroy
    delete_from_group = Group.find(params[:id])
    delete_from_group.users.delete(current_user)

    redirect_to restaurant_deal_group_path
  end

  # private
  #
  # def group_update_params
  #   params.require(:group).permit(:id)
  # end

end
