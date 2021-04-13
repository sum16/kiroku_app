class IntakeWater < ApplicationRecord
  belongs_to :family

  validates :amount_of_water, numericality: { only_integer: true }

end
