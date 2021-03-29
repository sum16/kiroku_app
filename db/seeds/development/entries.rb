events = Event.where(["application_start_time < ?", Time.current])
events.order(id: :desc).limit(3).each_with_index do |p,i|
  Family.order(:id).limit((i + 1) * 5).each do |c|
    p.applicants << c
  end
end
