class LessonsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: :index
  before_action :authorize_tutor, only: :new
  # before_action :find_lesson, only: [:show, :edit, :update, :destroy]

  def index
      @lessons = Lesson.all.order("created_at DESC")
      # render json: @lessons
    # redirect_to root_path
      @all_bookings = Booking.all.order("created_at DESC")
  end

  def show
    @all_lessons = Lesson.all.order("created_at DESC")
    find_lesson
    @booking = Booking.find_by_lesson_id(params[:id])
    # render json: @booking
    tutor = @lesson.tutor_id
    @lesson_tutor = User.find(tutor)
    @tutor_lessons = Lesson.where(tutor_id: tutor)
    @booked = Booking.pluck(:lesson_id)
  end

  def new
    @new_lesson = Lesson.new
  end

  def create
    @new_lesson = current_user.lessons.create(lesson_params)

    if @new_lesson.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if current_user.id == find_lesson.tutor_id
      @lesson = Lesson.find(params[:id])
      if @lesson.update(lesson_params)
        redirect_to lesson_path(@lesson)
      else
        render 'edit'
      end
    end
  end

  def authorize_tutor
    if current_user.reg_tutor == false
      redirect_to root_path
    end
  end

  def lesson_params
    params.require(:lesson).permit(:duration, :price, :datetime, :venue, :language_taught, :tutor_id, :name, :details)
  end

  private
  def find_lesson
    @lesson = Lesson.find(params[:id])
  end
end
