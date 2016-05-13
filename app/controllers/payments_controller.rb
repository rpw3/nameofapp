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
	    
	    if charge.paid
  			Order.create(params[:product_id,:user_id,:total])
  		end

	  rescue Stripe::CardError => e
	    # The card has been declined

	  redirect_to "/views/payments/create"
	  end
	end
end
