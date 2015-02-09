class UserMailer < ActionMailer::Base
  default :from => "punitha@gmail.com"
  
  def contact_us(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Feedback from irctc")
  end
end