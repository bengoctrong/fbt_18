class AddStartEndToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :start, :date
    add_column :users, :end, :date
  end
end
