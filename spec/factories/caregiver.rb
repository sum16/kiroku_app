FactoryBot.define do
  factory :caregiver do
    name { "田中太郎" }
    age { 30 }
    password { "password" }
  end

  factory :caregiver_sato, class: "Caregiver" do
    name { "佐藤太郎" }
    age { 45 }
    password { "password111" }
  end
end
