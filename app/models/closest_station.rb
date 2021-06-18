class ClosestStation < ApplicationRecord
  belongs_to :property, dependent: :destroy
end
