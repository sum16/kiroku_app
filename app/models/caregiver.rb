class Caregiver < ApplicationRecord
  has_secure_password
  has_many :care_recipitents
end
