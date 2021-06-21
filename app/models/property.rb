class Property < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :years_old, presence: true
  has_many :closest_stations, dependent: :destroy, inverse_of: :property
  accepts_nested_attributes_for :closest_stations, allow_destroy: true, reject_if: :reject_both_blank

  def reject_both_blank(attributes)
    if attributes[:id]
      attributes.merge!(_destroy: "1") if attributes[:line].blank? and attributes[:station].blank? and attributes[:distance].blank?
      !attributes[:line].blank? and attributes[:station].blank? and attributes[:distance].blank?
    else
      attributes[:line].blank? and attributes[:station].blank? and attributes[:distance].blank?
    end
  end

end
