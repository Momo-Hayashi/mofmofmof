class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.text :name
      t.integer :price
      t.text :address
      t.integer :years_old
      t.text :note
      t.timestamps
    end
  end
end
