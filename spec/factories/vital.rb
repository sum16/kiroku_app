FactoryBot.define do
  factory :vital do
    measuring_date { Today }
    temperature { 36.6 }
    breathing { 60 }
    low_blood_pressure { 100 }
    hign_blood_pressure { 125 }
    pulse { 60 }
    spo2 { 99 }
  end
end
