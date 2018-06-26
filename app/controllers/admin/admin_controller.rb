module Admin
  class AdminController < ApplicationController
    before_action :check_admin

    def new
      @bookings = Booking.includes(:tour).pending_status.order_desc
        .paginate page: params[:page], per_page: Settings.record_pages
    end

    def create
      @booking = Booking.find_by id: params[:booking][:id]
      if @booking
        update_status
        @booking.email_to_user
      else
        flash[:danger] = t "can't_found_booking"
      end
      redirect_back fallback_location: :new
    end

    private

    def update_status
      if params[:commit] == t("accept")
        @booking.accepted!
        flash[:info] = t "accept"
      elsif params[:commit] == t("reject")
        @booking.rejected!
        @booking.tour.update_attributes seats_remaining: @booking.tour.seats_remaining + @booking.quantity
        flash[:info] = t "reject"
      end
    end
  end
end
