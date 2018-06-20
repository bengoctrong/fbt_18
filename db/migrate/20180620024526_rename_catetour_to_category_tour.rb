class RenameCatetourToCategoryTour < ActiveRecord::Migration[5.1]
  def change
    rename_table :cate_tours, :category_tours
  end
end
