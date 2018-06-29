class ToursController < ApplicationController
  before_action :load_tour, only: :show

  def show
    @booking = Booking.new
    @review = Review.new
    @reviews = Review.includes(:user).review_by_tour(@tour.id).order_desc
      .paginate page: params[:page], per_page: Settings.admin_booking
  end

  private

  def load_tour
    @tour = Tour.find_by id: params[:id]
    return if @tour
    flash.now[:danger] = t "load_tour_failed"
    redirect_to root_path
  end
end
