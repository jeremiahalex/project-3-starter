class GroupsController < ApplicationController

  def new
    @new_group = current_user.groups.new
    # render json: current_user.groups
    @current_deal = Deal.find(params[:deal_id])
    # render json: Deal.find(params[:deal_id])
    @current_restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    render json: params


    # {
    #   pax: 123,
    #   date: 12-12-12
    #   datetime: 1233.t123123213
    #   deal_id: 33
    # }

    # creating_group = params.require(:group).permit(:pax, :date, :time)

    # creating_group[:deal_id] = params[:deal_id]

    # Group.create(creating_group)

    # redirect_to root_path

  end

    # render json: params
  def show_current_user
    current_user_groups = current_user.groups
    current_user_restaurants = current_user_groups.map do |group|
      group.restaurant
    end
    current_user_deals = current_user_groups.map do |group|
      group.deal
    end
    render json: {groups: current_user.groups, restaurants: current_user_restaurants, deals: current_user_deals}
  end

  def show_restaurant_on_profile
    current_group = Group.find(params[:id])
    current_restaurant = current_group.restaurant
    render json: current_restaurant
  end

  def index
    render html: 'show all groups within deals page'
  end

  def show
    @group = Group.find(params[:id])
    @group_time = Date.parse("#{@group.date} #{@group.time}")

    render json: {
      :group => @group,
      :formatted_time => @group_time
    }
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
