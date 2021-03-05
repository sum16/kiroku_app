class CareRecipitent < ApplicationRecord
  has_many :vitals
  has_many :intake_waters
  has_many :medicines
  has_many :excretums
  has_many :meals
  has_many :medical_histories
  enum gender: { man: 0, woman: 1}
  
end
