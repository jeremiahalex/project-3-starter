class LessonsController < ApplicationController
skip_before_action :verify_authenticity_token
before_action :authenticate_user!, only: :index

  def index
    @lessons = Lesson.all.order("created_at DESC")
  end

  def show
    @lesson = Lesson.find(params[:id])
    # render json: @lesson
    tutor = @lesson.tutor_id
    @lesson_tutor = User.find(tutor)
    @tutor_lessons = Lesson.where(id:tutor)

  end

  def new
    @new_lesson = Lesson.new
  end

  def create

    @new_lesson = current_user.lessons.create(params.require(:lesson).permit(:duration, :price, :datetime, :venue, :language_taught, :tutor_id))

    if @new_lesson.save
      redirect_to root_path
    else
      render 'new'
    end

  end
end
