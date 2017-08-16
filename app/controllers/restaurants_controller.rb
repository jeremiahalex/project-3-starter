class RestaurantsController < ApplicationController
  before_action :authenticate_user!

  def main
  end

  def index
    all_restaurants = Restaurant.all
    all_deals =
      all_restaurants.map do |restaurant|
        restaurant.deals
      end

    render json: {restaurants: all_restaurants, deals: all_deals}
  end

end
