FactoryBot.define do
  factory :medicine do
    check_before_breakfast { true }
    check_after_breakfast { false }
    check_before_lunch { true }
    check_after_lunch { false}
    check_before_dinner { true }
    check_after_dinner { false }
    check_eye_drops { true }
    check_ointment { false}
  end
end
