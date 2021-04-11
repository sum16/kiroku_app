class BathingDay < ApplicationRecord
  belongs_to :family

  with_options presence: true do
    validates :judge_bath
  end
end
