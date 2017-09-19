class UserMailer < ApplicationMailer
      layout 'awesome' # use awesome.(html|text).erb as the layout
    default from: 'ankitadangi11@gmail.com'
     
  def welcome_email(user)
    @user = user
    @site_name = "http://cd-online.herokuapp.com"
    @url  = 'http://cd-online.herokuapp.com/users/sign_in'
    mail(to: @user.email, content_type: "text/html", subject: 'Status updation App') 
  end
def receive(email)
    page = Page.find_by(address: email.to.first)
    page.emails.create(
      subject: email.subject,
      body: email.body
    )
 
    if email.has_attachments?
      email.attachments.each do |attachment|
        page.attachments.create({
          file: attachment,
          description: email.subject
        })
      end
    end
  end

end
  
