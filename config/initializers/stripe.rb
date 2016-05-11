if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_ExUlgQaROct87PSp53DeDudC',
    :secret_key => 'sk_test_FZHNi2iPw1hE65CXfOTNTmE9'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]