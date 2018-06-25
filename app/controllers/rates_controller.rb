class RatesController < ApplicationController
  before_action :load_tour, :logged_in?

  def create
    @rate = Rate.new rate_params
    if @rate.save
      flash[:success] = t "rate_success"
    else
      flash[:danger] = t "rate_failed"
    end
    cal_rating_mean
    redirect_to @tour
  end

  private

  def cal_rating_mean
    @tour.rates_mean = 0
    @tour.rates.each do |rate|
      @tour.rates_mean += rate.stars.to_f
    end
    @tour.rates_mean /= @tour.rates.size
  end

  def rate_params
    params.require(:rate).permit :tour_id, :stars, :user_id
  end

  def load_tour
    @tour = Tour.find_by id: params[:rate][:tour_id]
    return if @tour
    flash[:danger] = t "can't_found_tour"
    redirect_to root_path
  end
end
