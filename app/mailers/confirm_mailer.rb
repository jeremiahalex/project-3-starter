class ConfirmMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.confirm_mailer.new_confirmation.subject
  #
  def new_confirmation(new_booking)
    @new_booking = new_booking
    @lesson = @new_booking.lesson

    mail to: @new_booking.student.email,
         subject: "Thank you for booking #{@lesson.name}!"
  end
end


# this is like a controller
# but cannot get request params
# so we can pass it over
