class Post < ApplicationRecord
  belongs_to :caregiver
  has_many :share_buttons

  with_options presence: true do
    validates :title
    validates :body
end
