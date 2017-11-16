class PagesController < ApplicationController

  def home

     @lessons = Lesson.all
     @all_languages = Lesson.distinct.pluck(:language_taught).sort
     @all_prices = Lesson.distinct.pluck(:price).sort
     @all_requests = Lesson.search(params[:language_taught], params[:price])
     @booked = Booking.pluck(:lesson_id)

    #  render json: @allbooked
    #  @lessons.where(lesson_id: )
  end

end
