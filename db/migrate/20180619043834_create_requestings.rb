class CreateRequestings < ActiveRecord::Migration[5.1]
  def change
    create_table :requestings do |t|
      t.integer :user_id
      t.integer :tour_id
      t.integer :quantity

      t.timestamps
    end
    add_index :requestings, :user_id
    add_index :requestings, :tour_id
    add_index :requestings, [:user_id, :tour_id], unique: true
  end
end
