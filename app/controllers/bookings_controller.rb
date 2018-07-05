class BookingsController < ApplicationController
  before_action :load_tour, :logged_in?

  def create
    Booking.transaction do
      @booking = Booking.new booking_params
      @booking.total_price = multiplication @tour.price, params[:booking][:quantity].to_f
      if @booking.save
        seats_transaction
      else
        flash[:danger] = t "can't_booking_tour"
        redirect_to @tour
      end
    end
  end

  private

  def seats_transaction
    if update_total_seats
      flash[:success] = t "booking_completed"
      redirect_to root_path
    else
      flash[:danger] = t "out_of_seats"
      raise ActiveRecord::Rollback, t("out_of_seats")
    end
  end

  def booking_params
    params.require(:booking).permit :tour_id, :quantity, :user_id
  end

  def update_total_seats
    @tour.update_attributes seats_remaining: (@tour.quantity.to_i - params[:booking][:quantity].to_i)
  end

  def load_tour
    @tour = Tour.find_by id: params[:booking][:tour_id]
    return if @tour
    flash[:danger] = t "can't_found_tour"
    redirect_to @tour_path
  end
end
