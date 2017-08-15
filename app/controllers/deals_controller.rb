class DealsController < ApplicationController

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

end
