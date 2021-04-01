class Caregiver < ApplicationRecord
  has_secure_password
  has_many :care_recipitents
  has_many :events, foreign_key: "registrant_id", dependent: :restrict_with_exception

  attr_accessor :remember_me 

  with_options presence: true do
    validates :name
    validates :age
    validates :password_digest
  end
  
  #８文字〜１２文字制限
  validates :password_digest, presence: true, length: { minimum: 8, maximum: 15}
 
  #自動ログイン
  def remember_me?
    remember_me == "1"
  end
end
