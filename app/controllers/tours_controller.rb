class ToursController < ApplicationController
  before_action :load_tour, only: :show

  def show
    @booking = Booking.new
  end

  private

  def load_tour
    @tour = Tour.find_by id: params[:id]
    return if @tour
    flash.now[:danger] = t "load_tour_failed"
    redirect_to root_url
  end
end
