class Property < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :years_old, presence: true
  has_many :closest_stations, dependent: :destroy
  accepts_nested_attributes_for :closest_stations, reject_if: :all_blank
end
