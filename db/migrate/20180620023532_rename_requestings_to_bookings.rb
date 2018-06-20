class RenameRequestingsToBookings < ActiveRecord::Migration[5.1]
  def change
    rename_table :requestings, :bookings
  end
end
