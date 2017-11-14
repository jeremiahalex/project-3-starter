class ConfirmMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.confirm_mailer.new_confirmation.subject
  #
  def new_confirmation

    mail to: "nurhsans@gmail.com",
         subject: "Thank you for your purchase!"
    # not sure about this
  end
end
