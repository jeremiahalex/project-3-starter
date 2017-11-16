class PagesController < ApplicationController

  def home

     @lessons = Lesson.all
     @lessons_id = Lesson.ids
     @all_languages = Lesson.distinct.pluck(:language_taught).sort
     @all_prices = Lesson.distinct.pluck(:price).sort
     @all_requests = Lesson.search(params[:language_taught], params[:price])
     @booked = Booking.where(lesson_id: @lessons_id)
    #  render json: @lessons
  end

end
