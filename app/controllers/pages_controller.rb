class PagesController < ApplicationController
  def home
    @lessons = Lesson.all.order("created_at DESC")
  end
end
