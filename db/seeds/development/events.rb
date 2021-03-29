caregivers = Caregiver.order(:id)

20.times do |n|
   t = (18 - n).weeks.ago.midnight
   Event.create!(
     title: "イベント No.#{n + 1}",
      description: "ご家族様向けのイベントです。" * 10,
       application_start_time: t,
       application_end_time: t.advance(days: 7),
       registrant: caregivers.sample
   )
  end
