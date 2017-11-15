class LessonRegistrationMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.confirm_mailer.new_confirmation.subject
  #
  def new_registration(new_booking)
    @new_booking = new_booking
    @lesson = @new_booking.lesson

    mail to: @lesson.tutor.email,
         subject: "Your Lesson #{@lesson.name} has been booked!"
    # not sure about this
  end
end
