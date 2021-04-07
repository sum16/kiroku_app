class Post < ApplicationRecord
  belongs_to :caregiver
  has_many :share_buttons
end
