class Meal < ApplicationRecord
  belongs_to :family

  with_options presence: true do
    validates :breakfast
    validates :lunch
    validates :snack
    validates :dinner
    validates :meal_date
  end
end
