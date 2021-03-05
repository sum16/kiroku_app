class CareRecipitent < ApplicationRecord
  has_many :vitals
  has_many :intake_waters
  has_many :medicines
  has_many :excretums
  has_many :meals
  has_many :medical_histories
  has_many :behavior_histories
  has_many :families
  

  enum gender: { man: 0, woman: 1}
  
end
