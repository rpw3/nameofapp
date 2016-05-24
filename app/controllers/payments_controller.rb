class PaymentsController < ApplicationController
	def create
	  token = params[:stripeToken]
	  @product = Product.find(params[:product_id])
	  @payment.user = current_user
	  
	  # Create the charge on Stripe's servers - this will charge the user's card
	  begin
	    charge = Stripe::Charge.create(
	      :amount => 2000, # amount in cents, again
	      :currency => "usd",
	      :source => token,
	      :description => params[:stripeEmail]
	    )
	    if charge.paid
  		Order.create(product_id,user_id)
  		end
	  
	  rescue Stripe::CardError => e
	    # The card has been declined
	  	body = e.json_body
    	err = body[:error]
    	flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
  	end
	  
	  redirect_to product_path(product)  
	    
	  end
	end
end
