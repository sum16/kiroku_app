class CareRecipitent < ApplicationRecord
  has_many :vitals
  has_many :intake_waters
  has_many :medicines
  enum sex: { man: 0, woman: 1}
  
end
