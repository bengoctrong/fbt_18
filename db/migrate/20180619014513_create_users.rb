class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone
      t.string :bank_number
      t.string :address
      t.integer :role, default: 1

      t.timestamps
    end
  end
end
