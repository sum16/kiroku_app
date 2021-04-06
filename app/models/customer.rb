class Customer < ApplicationRecord
  has_one :customer_address, dependent: :destroy
  accepts_nested_attributes_for :customer_address


  validates :gender, inclusion: { in: %w(male female), allow_blunk: true}
  def password=(raw_password)
    if raw_password.kind_of?(String)
      self.hashed_password = BCrypt::Password.create(raw_password)
    elsif raw_password.nil?
      self.hashed_password = nil
    end
  end

  def together_save
    #トランザクション処理
    ActiveRecord::Base.transaction do
      customer.save!
      customer.home_address.save!
      customer.work_address.save!
    end
  end

end
