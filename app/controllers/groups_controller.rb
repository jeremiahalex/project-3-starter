class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_already_joined, :check_if_full, only: [:update]
  before_action :check_date_valid, only: [:create]

  def new
    @new_group = current_user.groups.new
    # render json: current_user.groups
    @current_deal = Deal.find(params[:deal_id])
    # render json: Deal.find(params[:deal_id]).restaurant_id
    current_restaurant_id = Deal.find(params[:deal_id]).restaurant_id
    # render json: @current_restaurant
    @current_restaurant = Restaurant.find(current_restaurant_id)

    @todayvariable = Date.today
  end

  def create
    creating_group = params.permit(:date, :time)
    creating_group[:deal_id] = params[:deal_id]
    new_group = Group.create(creating_group)
    new_group.users << current_user

    redirect_to deal_path(params[:deal_id])
  end

  def show_current_user
    current_user_groups = current_user.groups.where("date >= (?)", Date.today).order(:date).order(:time)
    current_user_restaurants = current_user_groups.map do |group|
      group.restaurant
    end
    current_user_deals = current_user_groups.map do |group|
      group.deal
    end
    render json: {groups: current_user_groups, restaurants: current_user_restaurants, deals: current_user_deals}
  end

  def show_restaurant_on_profile
    current_group = Group.find(params[:id])
    current_restaurant = current_group.restaurant
    render json: current_restaurant
  end

  def show
    @group = Group.find(params[:id])
  #  @group_time = Date.parse("#{@group.date} #{@group.time}")

  #   render json: {
  #     :group => @group,
  #     :formatted_time => @group_time
  #   }
  end

  def update
    update_group = Group.find(params[:id])
    update_group.users << current_user

    redirect_to group_path
  end

  def destroy
    delete_from_group = Group.find(params[:id])
    delete_from_group.users.delete(current_user)

    redirect_to group_path
  end

  private

  def check_already_joined
    group = Group.find(params[:id])
    if group.users.include? current_user
      flash[:join_error] = "You have already joined the group!"

      redirect_to group_path
    end
  end

  def check_if_full
    group = Group.find(params[:id])
    max_pax = group.deal.pax
    if group.users.count >= max_pax
      flash[:max_error] = "The group is full!"

      redirect_to group_path
    end
  end

  def check_date_valid
    # render json: params[:date].is_a?(String)
    if Date.parse(params[:date]) < Date.today
      flash[:date_error] = "Please enter a date that is today or after"

      redirect_to new_deal_group_path
    end
  end

end
