class IntakeWater < ApplicationRecord
  belongs_to :family

  with_options presence: true do
    validates :drink_date
    validates :amount_of_water
  end
end
