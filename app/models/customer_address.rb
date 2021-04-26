class CustomerAddress < ApplicationRecord
  belongs_to :customer

  #３桁の数字 + ハイフン + ４桁の数字
  validates :postal_code, format: { with: /\A\d{7}\z/ }
end
