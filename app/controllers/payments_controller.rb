class PaymentsController < ApplicationController
	def create
	  @product = Product.find(params[:product_id])
	  @payment.user = current_user
	  token = params[:stripeToken]
	  # Create the charge on Stripe's servers - this will charge the user's card
	  begin
	    charge = Stripe::Charge.create(
	      :amount => 2000, # amount in cents, again
	      :currency => "usd",
	      :source => token,
	      :description => params[:stripeEmail]
	    )
	  rescue Stripe::CardError => e
	    # The card has been declined

	    
	  end
	end
end