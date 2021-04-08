class CareRecipitent < ApplicationRecord
  has_many :medical_histories
  accepts_nested_attributes_for :medical_histories
  belongs_to :caregiver


  include PersonalNameHolder

  #名前カラムに対するバリデーション
  before_validation do 
    self.family_name = normalize_as_name(family_name)
    self.given_name = normalize_as_name(given_name)
    self.family_name_kana = normalize_as_furigana(family_name_kana)
    self.given_name_kana =  normalize_as_furigana(given_name_kana)
  end

  with_options presence: true do
    validates :age
    validates :gender
    validates :birthday
  end  

  #要支援度は１まで、要介護度は５まで
  validates :degree_of_support_required, inclusion: { in: 1..2 }
  validates :degree_of_care_required, inclusion: { in: 1..5 }
end
