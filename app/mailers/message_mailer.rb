class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.send_message.subject
  #
  def send_message(email, message)
    @message = message
    mail(to: email, subject: 'Nouveau message')
  end
end
