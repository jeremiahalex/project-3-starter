# Preview all emails at http://localhost:4200/rails/mailers/confirm_mailer
class ConfirmMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:4200/rails/mailers/confirm_mailer/new_confirmation
  def new_confirmation
    booking = Booking.last

    ConfirmMailer.new_confirmation(booking)
  end

end
