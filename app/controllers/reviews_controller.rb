class ReviewsController < ApplicationController
  before_action :logged_in_user, only: %i(create destroy)
  before_action :load_comment_destroy, only: :destroy
  before_action :load_comment_create, only: :create

  def create
    respond_to do |format|
      if @review.save
        format.html{redirect_to @tour}
        format.js
      else
        flash[:danger] = t "review_failed"
        format.html{redirect_to @tour}
      end
    end
  end

  def destroy
    respond_to do |format|
      if @review.destroy
        flash[:success] = t "delete_success_review"
        format.html{redirect_to @tour}
        format.js
      else
        flash[:danger] = t "delete_failed_review"
        format.html{redirect_to @tour}
      end
    end
  end

  private

  def load_comment_destroy
    if current_user.admin?
      @review = Review.find_by id: params[:id]
      flash[:danger] = t "no_review" if @review.blank?
    else
      @review = current_user.reviews.find_by id: params[:id]
      flash[:danger] = t "wrong_user" if @review.blank?
    end
    @tour = @review.tour
  end

  def load_comment_create
    @tour = Tour.find_by id: params[:review][:tour_id]
    if @tour
      @review = @tour.reviews.build review_params
    else
      flash[:danger] = t "load_tour_failed"
      redirect_to root_path
    end
  end

  def review_params
    params.require(:review).permit :tour_id, :content, :user_id
  end
end
