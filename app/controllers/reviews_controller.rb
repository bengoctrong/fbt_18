class ReviewsController < ApplicationController
  def create
    @review = Review.new review_params
    if @review.save
      respond_to do |format|
        format.html redirect_to @tour
        format.js
      end
    else
      flash[:danger] = t "can't_review"
      redirect_to @review
    end
  end

  private

  def review_params
    params.require(:review).permit :tour_id, :content, :user_id
  end
end
