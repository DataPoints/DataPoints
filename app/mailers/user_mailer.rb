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

  def success_mail(user, dataset)
    @user = user
    @dataset = dataset
    mail to: user.email, subject: "Analysis completed"
  end
end
