class TestimonialsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: :index

  def index
    @testimonials = Testimonial.all
  end

  def new
    @new_testimonial = Testimonial.new
  end

  def create
    @tutors = Users.find(tutor_id)

    @new_testimonial = current_user.testimonials.create(params.require(:testimonial).permit(:title, :content))

    if @new_testimonial.save
      redirect_to root_path
    else
      render 'new'
    end
  end

end
