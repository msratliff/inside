Rails.configuration.stripe = {
  :publishable_key => ENV['STRIPE_ID'],
  :secret_key      => ENV['STRIPE_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]