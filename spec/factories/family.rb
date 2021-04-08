FactoryBot.define do
  factory :family do

  family_name { "佐藤" }
  given_name { "恵子" }
  family_name_kana { "サトウ" }
  given_name_kana { "ケイコ" }
  address { "山形県" }
  relationship { "娘" }
  password { "password" }
  password_confirmation { "password" }
  care_recipitent_name { "佐藤太郎" }
  gender { "female" }
  
  end
end

