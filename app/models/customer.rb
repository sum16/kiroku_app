class Customer < ApplicationRecord
  has_one :customer_address, dependent: :destroy
  accepts_nested_attributes_for :customer_address

  HUMAN_NAME_REGEXP = /\A[\p{han}\p{hiragana}\p{katakana}\u{30fc}A-Za-z]+\z/
  KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/

  with_options presence: true do
    validates :family_name
    validates :given_name
    validates :family_name_kana
    validates :given_name_kana
    validates :gender
  end

  #カタカナ、漢字、ひらがな,アルファベット
  validates :family_name, :given_name, format: { with: HUMAN_NAME_REGEXP }
  #全角カタカナ
  validates :family_name_kana, :given_name_kana, format: { with: KATAKANA_REGEXP }
  
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
