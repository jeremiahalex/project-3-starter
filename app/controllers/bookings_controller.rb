class BookingsController < ApplicationController
  def show
    @lesson = Lesson.find(params[:id])
    # render json: @lesson
  end
end
