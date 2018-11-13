module Admin
  class BookingsController < AdminController
    def index
      @bookings = Booking.from_status(params[:commit]).order_desc
        .paginate page: params[:page], per_page: Settings.admin_booking
    end

    def edit
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
      Booking.transaction do
        if params[:commit] == t("accept")
          @booking.accepted!
        elsif params[:commit] == t("reject")
          @booking.rejected!
          @booking.tour.update_attributes seats_remaining: @booking.tour.seats_remaining + @booking.quantity
          flash[:info] = t "reject"
        end
      end
    end
  end
end
