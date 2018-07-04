class StaticPageController < ApplicationController
  def home
    return unless Tour.any?
    @feed_items = Tour.search_by_name(params[:search]).order_desc
      .paginate page: params[:page], per_page: Settings.record_pages
    flash.now[:warning] = t("no_record", search: params[:search]) if @feed_items.blank?
  end
end
