class NotificationMailer < ApplicationMailer
  default from: "from@example.com"

  def notification_email(addressee,current_user,child)
    @addressee = addressee.try(:email) || addressee
    @sender = current_user.email
    @child = child
    mail(to: "m.figand@gmail.com", subject: 'Notification Email')
    # mail(to: addressee.email, subject: 'Notification Email')
  end
end
