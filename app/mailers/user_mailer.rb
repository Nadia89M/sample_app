
class UserMailer < ApplicationMailer
  default from: "nadia.mohamed89@gmail.com"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'nadia.mohamed89@gmail.com',
         subject: "A new contact form message from #{name}")
  end
end
