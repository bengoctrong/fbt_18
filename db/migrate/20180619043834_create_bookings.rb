class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :tour_id
      t.integer :quantity

      t.timestamps
    end
    add_index :bookings, :user_id
    add_index :bookings, :tour_id
    add_index :bookings, [:user_id, :tour_id], unique: true
  end
end
