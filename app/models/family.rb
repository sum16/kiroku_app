class Family < ApplicationRecord
  belongs_to :care_recipitent
  has_many :behavior_histories

  enum gender: { man: 0, woman: 1}
end
