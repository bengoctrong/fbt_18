class CreateTours < ActiveRecord::Migration[5.1]
  def change
    create_table :tours do |t|
      t.string :name
      t.text :description
      t.integer :quantity

      t.timestamps
    end
  end
end
