class Caregiver < ApplicationRecord

  HUMAN_NAME_REGEXP = /\A[\p{han}\p{hiragana}\p{katakana}\u{30fc}A-Za-z]+\z/

  has_secure_password
  has_many :care_recipitents
  #eventsモデルで設定した任意の外部キーを指定している
  #:restrict_with_exceptionオプションは職員を削除してもイベントが削除されないようにする
  has_many :events, foreign_key: "registrant_id", dependent: :restrict_with_exception

  attr_accessor :remember_me 

  with_options presence: true do
    validates :name
    validates :age
    validates :password_digest
  end
  
  #８文字〜１２文字制限
  #validates :password_digest, presence: true, length: { minimum: 8, maximum: 15}

  validates :name, format: { with: HUMAN_NAME_REGEXP }
 
  #自動ログイン
  def remember_me?
    remember_me == "1"
  end
end
