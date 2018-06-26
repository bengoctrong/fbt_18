module Admin
  class AdminController < ApplicationController
    before_action :check_admin

    def new
      @bookings = Booking.includes(:tour).pending_status.order_desc
        .paginate page: params[:page], per_page: Settings.record_pages
    end

    def create
      @booking = Booking.find_by id: params[:booking][:id]
      if params[:commit] == t("accept")
        @booking.update_attributes status: Booking.statuses[:accepted]
        @booking.email_to_user
        flash[:info] = t("accept")
      elsif params[:commit] == t("reject")
        @booking.update_attributes status: Booking.statuses[:rejected]
        @booking.email_to_user
        @booking.tour.update_attributes seats_remaining: @booking.tour.seats_remaining + @booking.quantity
        flash[:info] = t("reject")
      end
      redirect_back fallback_location: :new
    end
  end
end
