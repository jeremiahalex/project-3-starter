class DealsController < ApplicationController

  # before_action :check_for_max, only: [:create]

  def index
    #show all deals by one restaurants
    @restaurant = Restaurant.find(params[:restaurant_id])
    @deals = @restaurant.deals

  end

  def show
    #show specified deal by one restaurant
    @deal = Deal.find(params[:id])
    @restaurant = @deal.restaurant

    @groups = @deal.groups

  end

  private

  def check_for_max
    # check if deals are max
    if condition

    else
      flash
    end
  end

end
