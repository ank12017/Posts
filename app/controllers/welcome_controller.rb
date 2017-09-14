class WelcomeController < ApplicationController
  def index
  end

  def contact_us_mailer
  	@email = params[:email]
  	@name = params[:name]
  	AdminMailer.new_contact_us_call(@email, @name).deliver_now
  	redirect_to root_path
  end 
end
