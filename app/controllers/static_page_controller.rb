class StaticPageController < ApplicationController
  def home
    @categories = Category.all
    return unless Tour.any?
    @feed_items = Tour.search_by_name(params[:search]).search_by_category(params[:category]).order_desc
      .paginate page: params[:page], per_page: Settings.record_pages
    flash.now[:warning] = t("no_record", search: params[:search]) if @feed_items.blank?
  end
end
