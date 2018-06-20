class AddStartEndToTours < ActiveRecord::Migration[5.1]
  def change
    add_column :tours, :start, :date
    add_column :tours, :end, :date
  end
end
