class UserMailer < ActionMailer::Base
  default from: "noreply@datapoints.com"

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end

  def error_mail(user, error)
    @user = user
    @error = error
    mail to: user.email, subject: "Nastala chyba"
  end
end
