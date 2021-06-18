class AddPropertyRefToClosestStations < ActiveRecord::Migration[5.2]
  def change
    add_reference :closest_stations, :property, foreign_key: true
  end
end
