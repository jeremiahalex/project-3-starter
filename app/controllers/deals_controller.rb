class DealsController < ApplicationController

  def index
    #show all deals by one restaurants
    @restaurant = Restaurant.find(params[:restaurant_id])
    @deals = @restaurant.deals.all

  end

  def show
    #show specified deal by one restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])

    @deal = @restaurant.deals.find(params[:id])
    
    @groups = @deal.groups

  end

end
