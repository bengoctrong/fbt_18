class StaticPageController < ApplicationController
  before_action :init_homepage, only: :home

  def home
    flash.now[:warning] = t("no_record", search: params[:search]) if @feed_items.blank?
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def init_homepage
    @categories = Category.all
    @feed_items = Tour.search_by_name(params[:search]).search_by_category(params[:category]).order_desc
      .paginate page: params[:page], per_page: Settings.record_pages
  end
end
