class AddStartEndToTours < ActiveRecord::Migration[5.1]
  def change
    add_column :tours, :start_date, :date
    add_column :tours, :end_date, :date
  end
end
