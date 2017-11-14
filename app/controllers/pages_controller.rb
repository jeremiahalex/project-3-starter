class PagesController < ApplicationController

  def home

     @lessons = Lesson.all
     @users = User.all
  end

end
