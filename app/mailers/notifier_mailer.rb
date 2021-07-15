class NotifierMailer < ActionMailer::Base
  default from: 'notifications@example.com'

  def mail_activate_instructions(user)
    @user = user
    mail(to: user.email, subject: "Mail Activate Instructions")
  end

  def password_reset_instructions(user)
    @user = user
    mail(to: user.email, subject: "Password Reset Instructions")
  end
end