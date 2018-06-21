class StaticPageController < ApplicationController
  def home
    return unless Tour.any?
    @feed_items = Tour.order_desc.paginate page: params[:page], per_page: Settings.record_pages
  end
end
