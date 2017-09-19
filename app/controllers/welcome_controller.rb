class WelcomeController < ApplicationController
  def index
  end

  def contact_us_mailer
  	debugger
  	@email = params[:email]
  	@name = params[:name]
  	AdminMailer.new_contact_us_call(@email,@name).deliver_now if user_signed_in? 
  	redirect_to root_path
  end 
end
