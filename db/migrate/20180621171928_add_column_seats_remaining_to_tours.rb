class AddColumnSeatsRemainingToTours < ActiveRecord::Migration[5.1]
  def change
    add_column :tours, :seats_remaining, :integer
  end
end
