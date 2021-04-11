class Vital < ApplicationRecord
  belongs_to :family

  #数字の範囲以外は保存されない
  validates :spo2, inclusion: { in: 1..100 }
  validates :pulse, inclusion: { in: 1..200 }
  validates :breathing, inclusion: { in: 1..200 }
  validates :spo2, numericality: { only_integer: true }
  validates :pulse, numericality: { only_integer: true }
  validates :temperature, numericality: { only_integer: true }
  validates :low_blood_pressure, numericality: { only_integer: true }
  validates :hign_blood_pressure, numericality: { only_integer: true }


  with_options presence: true do
    validates :pulse
    validates :spo2
    validates :breathing
    validates :low_blood_pressure
    validates :hign_blood_pressure
    validates :temperature
  end

end
