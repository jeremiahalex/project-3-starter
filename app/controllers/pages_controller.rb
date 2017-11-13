class PagesController < ApplicationController

  def home

     @users = User.all

    #  @lessons = Lesson.all

  end

end
