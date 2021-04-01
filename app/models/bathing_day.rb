class BathingDay < ApplicationRecord
  belongs_to :family

  with_options presence: true do
    validates :bathing_date
    validates :judge_bath
  end
end
