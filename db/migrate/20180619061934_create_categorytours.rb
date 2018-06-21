class CreateCategorytours < ActiveRecord::Migration[5.1]
  def change
    create_table :categorytours do |t|
      t.integer :category_id
      t.integer :tour_id

      t.timestamps
    end
    add_index :categorytours, :category_id
    add_index :categorytours, :tour_id
    add_index :categorytours, [:category_id, :tour_id], unique: true
  end
end
