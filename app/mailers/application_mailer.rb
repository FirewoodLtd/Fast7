class ApplicationMailer < ActionMailer::Base
  default from: 'Firewood Tools<info@firewoodtools.com>'
  layout 'mailer'
  
  def welcome_email(user, url)
    @user = user
    @url =url
    mail(:to => user.email, :subject => "Welcome to Firewood Tools!")
  end   
end
