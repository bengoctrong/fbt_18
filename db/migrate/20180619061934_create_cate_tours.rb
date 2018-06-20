class CreateCateTours < ActiveRecord::Migration[5.1]
  def change
    create_table :cate_tours do |t|
      t.integer :category_id
      t.integer :tour_id

      t.timestamps
    end
    add_index :cate_tours, :category_id
    add_index :cate_tours, :tour_id
    add_index :cate_tours, [:category_id, :tour_id], unique: true
  end
end
