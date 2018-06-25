class Admin::MailerController < ApplicationController
  before_action :load_booking
  def new
    @booking = Booking.all
  end

  private

  def load_booking
    @booking = Booking.find_by id: params[:id]
    return if @booking
  end
end
