class ChargesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!


  def create
    @amount = 3990
    points_given = 30
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

    current_user.add_point(points_given)
    current_user.subscription_type = true
    current_user.save

    flash[:notice] = "Thank you. We have received your payment of $39.90. The system has added #{points_given} points to your account"
    redirect_to "/choose_size_style/#{current_user.child[0].size_id}/0"


  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to profile_path
  end
end
