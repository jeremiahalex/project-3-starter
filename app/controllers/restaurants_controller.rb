class RestaurantsController < ApplicationController
  before_action :authenticate_user!

  def main
  end

  def index
    all_restaurants = Restaurant.all
    #search by restaurant name
    if params[:search]
      all_restaurants = Restaurant.search(params[:search]).order("created_at DESC")
    else
      all_restaurants = Restaurant.all.order("created_at DESC")
    end

    all_deals =
      all_restaurants.map do |restaurant|
        restaurant.deals
      end

    render json: {restaurants: all_restaurants, deals: all_deals}
  end

  def search
  @restaurants = Restaurant.all
  if params[:search]
    @restaurant = Resraurant.search(params[:search]).order("created_at DESC")
  else
    @restaurant = Restaurant.all.order("created_at DESC")
  end
end

end
