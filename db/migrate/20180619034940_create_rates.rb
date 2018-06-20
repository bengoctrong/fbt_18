class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.integer :user_id
      t.integer :tour_id
      t.integer :stars

      t.timestamps
    end
    add_index :rates, :user_id
    add_index :rates, :tour_id
    add_index :rates, [:user_id, :tour_id], unique: true
  end
end
