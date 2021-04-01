class Family < ApplicationRecord

  with_options presence: true do
    validates :family_name
    validates :given_name
    validates :family_name_kana
    validates :given_name_kana
    validates :gender
    validates :relationship
    validates :address
  end
  #全角カタカナ
  validates :family_name_kana, :given_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  #８文字〜１２文字制限
  validates :password_digest, presence: true, length: { minimum: 8, maximum: 15}

  has_secure_password
  has_one :home_address, dependent: :destroy
  has_one :work_address, dependent: :destroy
  
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

  def remember_me?
    remember_me == "1"
  end

end
