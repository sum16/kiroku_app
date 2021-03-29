class CareRecipitent < ApplicationRecord
  belongs_to :caregiver
  has_one :family

  include PersonalNameHolder

  #名前カラムに対するバリデーション
  before_validation do 
    self.family_name = normalize_as_name(family_name)
    self.given_name = normalize_as_name(given_name)
    self.family_name_kana = normalize_as_furigana(family_name_kana)
    self.given_name_kana =  normalize_as_furigana(given_name_kana)
  end
  

  enum gender: %i( 男性 女性 )
  
end
