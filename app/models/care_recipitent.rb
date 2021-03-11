class CareRecipitent < ApplicationRecord
  belongs_to :caregiver
  has_one :family


  enum gender: %i( 男性 女性 )
  
end
