class ClosestStation < ApplicationRecord
  belongs_to :property, inverse_of: :closest_stations
end
