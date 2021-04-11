class IntakeWater < ApplicationRecord
  belongs_to :family

  with_options presence: true do
    validates :amount_of_water
  end

  validates :amount_of_water, numericality: { only_integer: true }

end
