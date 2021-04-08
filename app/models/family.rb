class Family < ApplicationRecord
  has_secure_password
  
  HUMAN_NAME_REGEXP = /\A[\p{han}\p{hiragana}\p{katakana}\u{30fc}A-Za-z]+\z/
  KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/

  with_options presence: true do
    validates :family_name
    validates :given_name
    validates :family_name_kana
    validates :given_name_kana
    validates :gender
    validates :address
    validates :relationship
  end

  #カタカナ、漢字、ひらがな,アルファベット
  validates :family_name, :given_name, format: { with: HUMAN_NAME_REGEXP }
  #全角カタカナ
  validates :family_name_kana, :given_name_kana, format: { with: KATAKANA_REGEXP }
  #８文字〜１5文字制限
  #validates :password_digest, presence: true, length: { minimum: 8, maximum: 15}
  validates :gender, inclusion: { in: %w(male female), allow_blank: true }
  
  has_many :vitals
  accepts_nested_attributes_for :vitals
  has_many :bathing_days
  accepts_nested_attributes_for :bathing_days
  has_many :intake_waters
  accepts_nested_attributes_for :intake_waters
  has_many :medicines
  accepts_nested_attributes_for :medicines
  has_many :excretas
  accepts_nested_attributes_for :excretas
  has_many :meals
  accepts_nested_attributes_for :meals
  has_many :behavior_histories
  accepts_nested_attributes_for :behavior_histories

  has_many :entries, dependent: :destroy
  has_many :events, through: :entries
  has_many :messages
  #顧客が送信したメッセージのリストを取得
  has_many :outbound_messages, class_name: "FamilyMessage", foreign_key: "family_id"
  #職員から受け取ったメッセージのリストを取得
  has_many :inbound_messages, class_name: "CaregiverMessage", foreign_key: "family_id"



  #自動ログイン
  def remember_me?
    remember_me == "1"
  end



end

