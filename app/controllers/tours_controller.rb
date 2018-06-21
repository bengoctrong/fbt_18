class ToursController < ApplicationController
  before_action :load_tour

  def show; end

  private

  def load_tour
    return if @tour = Tour.find_by(id: params[:id])
    flash.now[:danger] = t "load_tour_failed"
    redirect_to root_url
  end
end
