class FixTourColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :tours, :content, :description
  end
end
