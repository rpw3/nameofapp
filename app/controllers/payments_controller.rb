class PaymentsController < ApplicationController
  	def create
  	  token = params[:stripeToken]
  	  product = Product.find(params[:product_id])
  	  # @payment.user = current_user we dont need this 
  	  
  	  # Create the charge on Stripe's servers - this will charge the user's card
      charge = Stripe::Charge.create(
        :amount => 2000, # amount in cents, again
        :currency => "usd",
        :source => token,
        :description => params[:stripeEmail]
      )
     
  		Order.create() if charge.paid

  		# we dont have to do anything here it should render payments/create.html.erb file
    
    rescue Stripe::CardError => e
      # The card has been declined
    	body = e.json_body
    	err = body[:error]
    	flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}" 
    	# if there is an erro it will send the user back to the product it came from
    	redirect_to product_path(product)
  	end
  end