require "action_mailer"

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :enable_starttls_auto => true,
    :tls => false,
    :address => "smtp.gmail.com",
    :port => 587,
    :domain => "gmail.com",
    :authentication => "plain",
    :user_name => "tp3fiit@gmail.com",
    :password => ".Janko&Marienka."
}

class Notifier < ActionMailer::Base
  default :from => "tp3fiit@gmail.com"

  @notify_emails = "igordanis@yahoo.com"

  def deploy_notification
    now = Time.now
    msg = "Performed a deploy operation on #{now.strftime("%m/%d/%Y")} at #{now.strftime("%I:%M %p")}"

    mail(:to => ["igordanis@yahoo.com","axll.ostrovsky@gmail.com","peteruherek@gmail.com","j.kmetko@gmail.com","martinlosak2@gmail.com","martin.kosut.sk@gmail.com","michal.holub@stuba.sk"],
         :subject => "Datapoints deployed to production") do |format|
      format.text { render :text => msg}
      format.html { render :text => "<p>" + msg + "<\p>"}
    end
  end
end