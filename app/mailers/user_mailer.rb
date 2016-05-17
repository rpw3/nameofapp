class UserMailer < ApplicationMailer

default from: "bob@wrightco.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => 'bwright13@hotmail.com',
        :subject => "A new contact form message from #{name}")
  end
end

	def thank_you
  	@name = params[:name]
  	@email = params[:email]
  	@message = params[:message]
  	UserMailer.contact_form(@email, @name, @message).deliver_now
	end

    def welcome_email(email)
    @email  = params[:email]
    @url  = 'http://wrightco.herokuapp.com/users/sign_in'    
    mail(to: @user.email, subject: 'Welcome to Wright Co.')
    UserMailer.welcome_email( @email, @url).deliver_now
  end
end

