class ClothesController < ApplicationController

  def index
    @all_clothes = ClothesSet.all
    # render json: @all_clothes
  end

end
