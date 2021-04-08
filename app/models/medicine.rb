class Medicine < ApplicationRecord
  belongs_to :family

  with_options presence: true do
    validates :medicine_date
    validates :check_before_breakfast
    validates :check_after_breakfast
    validates :check_before_lunch
    validates :check_after_lunch
    validates :check_before_dinner
    validates :check_after_dinner
    validates :check_ointment
    validates :check_eye_drops
  end

  validates :check_before_breakfast, inclusion: { in: [true, false]}
  validates :check_after_breakfast, inclusion: { in: [true, false]}
  validates :check_before_lunch, inclusion: { in: [true, false]}
  validates :check_after_lunch, inclusion: { in: [true, false]}
  validates :check_before_dinner, inclusion: { in: [true, false]}
  validates :check_after_dinner, inclusion: { in: [true, false]}
end
