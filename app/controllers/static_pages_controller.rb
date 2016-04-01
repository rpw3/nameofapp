class StaticPagesController < ApplicationController
  
  def landing_page
  	@featured_product = Product.first
  end

  def landing_page
  	@products = Product.limit(3)
  end	
    
  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    ActionMailer::Base.mail(:from => @email,
    :to => 'bwright13@hotmail.com',
    :subject => "A new contact form message from #{@name}",
    :body => @message).deliver_now
	end 

end


