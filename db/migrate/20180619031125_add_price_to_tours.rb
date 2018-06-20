class AddPriceToTours < ActiveRecord::Migration[5.1]
  def change
    add_column :tours, :price, :decimal, precision: 8, scale: 2
  end
end
