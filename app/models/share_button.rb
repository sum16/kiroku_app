class ShareButton < ApplicationRecord
  belongs_to :caregiver
  belongs_to :post

  #１人１回の確認ボタン
  validates_uniqueness_of :post_id, scope: :caregiver_id
end

