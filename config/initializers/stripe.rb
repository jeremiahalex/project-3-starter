Rails.configuration.stripe = {
  :publishable_key => ENV['PUBLISHABLE_KEY'],
  :secret_key      => ENV['SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

# acct = Stripe::Account.create({
#     :country => "SG",
#     :type => "custom"
# })
#
# charge = Stripe::Charge.create({
#   :amount => 1000,
#   :currency => "sgd",
#   :source => "tok_visa",
#   :destination => {
#     :account => "{CONNECTED_STRIPE_ACCOUNT_ID}",
#   }
# })
