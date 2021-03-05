class Family < ApplicationRecord
  belongs_to :care_recipitent

  enum gender: { man: 0, woman: 1}
end
