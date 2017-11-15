# Preview all emails at http://localhost:4200/rails/mailers/lesson_registration_mailer
class LessonRegistrationMailerPreview < ActionMailer::Preview

  def new_confirmation
    @tutor_email = @new_booking.lesson.tutor.email
    ConfirmMailer.new_confirmation(@tutor_email)
  end

end
