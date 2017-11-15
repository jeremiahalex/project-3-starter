# Preview all emails at http://localhost:4200/rails/mailers/lesson_registration_mailer
class LessonRegistrationMailerPreview < ActionMailer::Preview

  def new_registration
    booking = Booking.last

    LessonRegistrationMailer.new_registration(booking)
  end

end
