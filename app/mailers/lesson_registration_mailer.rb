class LessonRegistrationMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.confirm_mailer.new_confirmation.subject
  #
  def new_registration(email)
    @tutor = email

    mail to: @tutor,
         subject: "Your Lesson has been booked!"
    # not sure about this
  end
end
