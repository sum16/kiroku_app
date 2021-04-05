families = Family.all 
caregivers = Caregiver.where(suspended: false).all

s = 2.years.ago
23.times do |n|
  m = FamilyMessage.create!(
    family: families.sample,
    subject: "これは問い合わせです。" * 4,
    body: "これは問い合わせです。\n" *  8,
    created_at: s.advance(months: n),
    caregiver_id: 1

  )
  r = CaregiverMessage.create!(
    family: m.family,
    caregiver: caregivers.sample,
    root: m,
    parent: m,
    subject: "これは返信です。" * 4,
    body: "これは返信です。\n" * 8,
    created_at: s.advance(months: n, hours: 1),
    caregiver_id: 1
  )
  if n % 6 == 0
    m2 = FamilyMessage.create!(
      family: r.family,
      root: m,
      parent: r,
      subject: "これは返信への回答です。",
      body: "これは返信への回答です。",
      created_at: s.advance(months: n, hours: 2),
      caregiver_id: 1
    )
    CaregiverMessage.create!(
      family: m2.family,
      caregiver: caregivers.sample,
      root: m,
      parent: m2,
      subject: "これは回答への返信です。",
      body: "これは回答への返信です。",
      created_at: s.advance(months: n, hours: 3),
      caregiver_id: 1
    )
  end
end

s = 24.hours.ago
8.times do |n|
  FamilyMessage.create!(
    family: families.sample,
    subject: "これは問い合わせ。" * 4,
    body: "これは問い合わせです。\n" * 8,
    created_at: s.advance(hours: n * 3),
    caregiver_id: 1
  )
end
