module Admin
  class ToursController < AdminController
    before_action :load_category, only: :index

    def index
      @feed_items = Tour.search_by_name(params[:search]).search_by_category(params[:category]).order_desc
        .paginate page: params[:page], per_page: Settings.record_pages_admin
    end

    def new
      @tour = Tour.new
    end

    def create
      @tour = Tour.new tour_params
      if @tour.save
        flash[:success] = t "create_tour_success"
        render :index
      else
        flash[:danger] = t "create_tour_failed"
        render :new
      end
    end

    def destroy; end

    private

    def load_category
      @categories = Category.all
    end

    def tour_params
      params.require(:tour).permit :name, :description, :quantity, :picture, :start_date,
        :end_date, :price
    end
  end
end
