class ChargesController < ApplicationController
  def new

  end

  def create
    # Amount in cents
    @amount = 3990

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    current_user.add_point(30)
    current_user.subscription_type = true
    current_user.save

    flash[:notice] = "Thank you. You have paid $39.90. 30 points have been added to your account"
    redirect_to profile_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to "/choose_size_style/#{current_user.child[0].size_id}/0"
  end
end
