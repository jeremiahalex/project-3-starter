class ConfirmMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.confirm_mailer.new_confirmation.subject
  #
  def new_confirmation(email)
    @student = email

    mail to: @student,
         subject: "Thank you for your purchase!"
  end
end
