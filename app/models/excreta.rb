class Excreta < ApplicationRecord
  belongs_to :family

  with_options presence: true do
    validates :judge_pee
    validates :judge_shit
  end
end
