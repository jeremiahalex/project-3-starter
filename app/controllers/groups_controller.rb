class GroupsController < ApplicationController
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
end
