Rails.configuration.stripe = {
  :publishable_key => "pk_test_tohAIYduSlgS1QsGa1ANeIPA",
  :secret_key      => "sk_test_aDqyrIA4gZTTxC43pcmDaV1O"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
