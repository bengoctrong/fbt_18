class UsersController < ApplicationController
  def show
    @bookings = Booking.from_status(params[:commit]).all.order_desc
      .paginate page: params[:page], per_page: Settings.admin_booking
  end

  def cancel_booking
    Booking.transaction do
      @booking = Booking.find_by id: params[:booking][:id]
      if @booking
        @booking.canceled!
        seats_transaction
      else
        flash[:danger] = t "can't_found_booking"
      end
      redirect_back fallback_location: :new
    end
  end

  private

  def seats_transaction
    if update_seats
      flash[:success] = @booking.status
    else
      flash[:danger] = t "can't_cancel"
      raise ActiveRecord::Rollback, t("can't_cancel")
    end
  end

  def update_seats
    @booking.tour.update_attributes seats_remaining: @booking.tour.seats_remaining + @booking.quantity
  end
end
