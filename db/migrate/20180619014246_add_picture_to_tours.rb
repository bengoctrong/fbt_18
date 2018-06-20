class AddPictureToTours < ActiveRecord::Migration[5.1]
  def change
    add_column :tours, :picture, :string
  end
end
