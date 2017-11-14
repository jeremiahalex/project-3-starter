class ChargesController < ApplicationController
  def new
  end

  def create

    @new_booking = Booking.create(
      student_id: current_user.id,
      lesson_id: params[:lessonId]
    )

    ConfirmMailer.new_confirmation.deliver_later

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


  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
