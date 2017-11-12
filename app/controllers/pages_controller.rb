class PagesController < ApplicationController

  def home

    @users = User.all

    @lessons = Lesson.all.order("created_at DESC")

  end

end
