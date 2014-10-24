class UserMailer < ActionMailer::Base
  default from: "noreply@pfs-sample-code.herokuapp.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://pfs-sample-code.herokuapp.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def engagement_email(user)
    @user = user
    mail(to: @user.email, subject: 'We miss you! Come back!')
  end
end
