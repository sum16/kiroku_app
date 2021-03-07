Caregiver.create!(
  name: "児玉悠生",
  age: 28,
  password: "password"
)

if Rails.env == "development"
    (1..20).each do |i|
    Caregiver.create(name: "#{i}さん",
                      age: "#{i}",
                      password: "password"
    )
    end
  end
