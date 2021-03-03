class CareRecipitent < ApplicationRecord
  has_many :vitals
  enum sex: { man: 0, woman: 1}
  
end
