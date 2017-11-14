class BookingsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: :index
  before_action :authorize_author, only: [:edit, :destroy]

  def index
    @user_lesson = current_user.lessons
    @booked = Booking.all
    # render json: @booked
  end

  def show
    find_current_lesson
    # render json: @lesson
  end

  def edit
    find_current_lesson
  end

  def destroy
    find_current_lesson
    @lesson.destroy
    redirect_to bookings_path
  end

  def authorize_author
    unless current_user.id == find_current_lesson.tutor_id
      redirect_to root_path
    end
  end

  private
  def find_current_lesson
    @lesson = Lesson.find(params[:id])
  end
end
