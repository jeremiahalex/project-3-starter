class LessonsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: :index
  before_action :authorize_tutor, only: :new
  # before_action :find_lesson, only: [:show, :edit, :update, :destroy]

  def index
      @lessons = Lesson.all.order("created_at DESC")
    #redirect_to root_path
  end

  def show
    @lesson = Lesson.find(params[:id])
    # render json: @lesson
    tutor = @lesson.tutor_id
    @lesson_tutor = User.find(tutor)
    @tutor_lessons = Lesson.where(id: tutor)
  end

  def new
    @new_lesson = Lesson.new
  end

  def create
    @new_lesson = current_user.lessons.create(params.require(:lesson).permit(:duration, :price, :datetime, :venue, :language_taught, :tutor_id, :name, :details))

    if @new_lesson.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
      if @lesson.update(create)
        redirect_to lesson_path(@lesson)
      else
        render 'edit'
      end
  end

  def authorize_tutor
    if current_user.reg_tutor == false
      redirect_to root_path
    end
  end

  # private
  # def find_lesson
  #   @lesson = Lesson.find(params[:id])
  # end
end
