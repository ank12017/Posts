class AdminMailer < ApplicationMailer
	default to: Proc.new { Admin.pluck(:email) },
          from: 'notification@example.com'
 
  def new_registration(user)
    @user = user
    mail(subject: "New User Signup: #{@user.email}")
  end

  def new_contact_us_call(user)
    @user = user
    mail(subject: "Test Email")
  end
end
