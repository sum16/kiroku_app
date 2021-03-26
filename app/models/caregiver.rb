class Caregiver < ApplicationRecord
  has_secure_password
  has_many :care_recipitents

  attr_accessor :remember_me 

  include PersonalNameHolder

  #名前カラムに対するバリデーション
  before_validation do 
    self.family_name = normalize_as_name(family_name)
    self.given_name = normalize_as_name(given_name)
    self.family_name_kana = normalize_as_furigana(family_name_kana)
    self.given_name_kana =  normalize_as_furigana(given_name_kana)
  end
 
  #自動ログイン
  def remember_me?
    remember_me == "1"
  end
end
