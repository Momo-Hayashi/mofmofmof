class CreateClosestStations < ActiveRecord::Migration[5.2]
  def change
    create_table :closest_stations do |t|
      t.string :line
      t.string :station
      t.integer :distance
      t.timestamps
    end
  end
end
