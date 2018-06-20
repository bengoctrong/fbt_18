class RemovePriceToTours < ActiveRecord::Migration[5.1]
  def change
    remove_column :tours, :price, :float
  end
end
