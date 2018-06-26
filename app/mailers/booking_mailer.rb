class BookingMailer < ApplicationMailer
  def request_user booking
    @booking = booking
    mail to: booking.user.email, subject: t("request_user")
  end
end
