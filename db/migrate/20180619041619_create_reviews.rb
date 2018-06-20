class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :tour_id
      t.integer :user_id
      t.text :content

      t.timestamps
    end
    add_index :reviews, :user_id
    add_index :reviews, :tour_id
    add_index :reviews, [:user_id, :tour_id], unique: true
  end
end
