class ChargesController < ApplicationController
  def new
    # redirect_to bookings_path
  end


  def create
    # render json: [:tutor_email]

    @new_booking = Booking.create(
      student_id: current_user.id,
      lesson_id: params[:lessonId]
    )

    # @tutor_email = @new_booking.lesson.tutor.email
    # @student_email = @new_booking.student.email

    LessonRegistrationMailer.new_registration(@new_booking).deliver_later
    ConfirmMailer.new_confirmation(@new_booking).deliver_later

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: params[:amount],
      description: 'Rails Stripe customer',
      currency: 'sgd'
    )

    redirect_to bookings_path

  rescue Stripe::CardError => e
    flash[:error] = e.message

    redirect_to new_charge_path

  end
end
