class Notifier < ActionMailer::Base
  def contact_us_notification(sender)
    @sender = sender
    mail(:to => "tp3fiit@gmail.com",
         :from => sender.email,
         :subject => "New email sent from galaxy of internet")
  end
end
