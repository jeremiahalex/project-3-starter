class ClothesController < ApplicationController

  def index
    @all_clothes = ClothesSet.all.limit(25)
    # render json: @all_clothes
  end

end
