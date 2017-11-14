class PagesController < ApplicationController

  def home

     @lessons = Lesson.all
     @all_languages = Lesson.distinct.pluck(:language_taught).sort
     @all_result = Lesson.search(params[:language_taught])

  end



    # dates = Request.distinct.pluck(:date).sort
    # @all_dates = dates.map! { |date| date.strftime('%d %b %Y (%a)') }
    # @all_requests = Request.search(params[:area], params[:date]).all.sort { |a,b| a.date <=> b.date }


end
