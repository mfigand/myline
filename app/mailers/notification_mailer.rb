class NotificationMailer < ApplicationMailer
  default from: "from@example.com"

  def notification_email(user)
    binding.pry
    @user = user
    mail(to: "m.figand@gmail.com", subject: 'Notification Email')
    # mail(to: @user.email, subject: 'Sample Email')
  end
end
