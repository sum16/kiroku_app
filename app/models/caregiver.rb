class Caregiver < ApplicationRecord
  has_secure_password
  has_many :care_recipitents
  accepts_nested_attributes_for :care_recipitents
end
