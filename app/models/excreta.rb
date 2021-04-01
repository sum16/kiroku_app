class Excreta < ApplicationRecord
  belongs_to :family

  with_options presence: true do
    validates :excreta_date
    validates :judge_pee
    validates :judge_shit
  end
end
