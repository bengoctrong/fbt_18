class BookingsController < ApplicationController
  before_action :load_tour, :logged_in?

  def create
    @booking = Booking.new booking_params
    if @booking.save
      update_total_seats
      flash[:success] = t "booking_completed"
      redirect_to root_path
    else
      flash[:danger] = t "can't_booking_tour"
      redirect_to @tour
    end
  end

  private

  def booking_params
    params.require(:booking).permit :tour_id, :quantity, :user_id
  end

  def update_total_seats
    @booking_order = params[:booking][:quantity]
    @tour.update_attributes seats_remaining: (@tour.quantity.to_i - @booking_order.to_i)
    @booking.update_attributes total_price: (@tour.price * @booking_order.to_f)
  end

  def load_tour
    @tour = Tour.find_by id: params[:booking][:tour_id]
    return if @tour
    flash[:danger] = t "can't_found_tour"
    redirect_to root_path
  end
end
