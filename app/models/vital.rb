class Vital < ApplicationRecord
  belongs_to :family

  #数字の範囲以外は保存されない
  validates :spo2, inclusion: { in: 1..100 }
  validates :pulse, inclusion: { in: 1..200 }
  validates :breathing, inclusion: { in: 1..200 }
  validates :temperature, inclusion: { in: 1..45 }

  with_options presence: true do
    validates :pulse
    validates :spo2
    validates :breathing
    validates :low_blood_pressure
    validates :hign_blood_pressure
    validates :temperature
    validates :measuring_date
  end

end
