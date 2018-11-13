class StaticPageController < ApplicationController
  before_action :load_categories, only: :home

  def home
    @feed_items = Tour.search_by_name(params[:search]).search_by_category(params[:category]).order_desc
      .paginate page: params[:page], per_page: Settings.record_pages
    flash.now[:warning] = t("no_record", search: params[:search]) if @feed_items.blank?
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def load_categories
    @categories = Category.all
  end
end
