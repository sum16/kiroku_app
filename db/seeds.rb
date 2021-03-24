table_names = %w(caregivers care_recipitents vitals intake_waters medicines excretums meals medical_histories
   behavior_histories families customers)

table_names.each do |table_name|
  path = Rails.root.join("db", "seeds", Rails.env, "#{table_name}.rb")
  if File.exist?(path)
    puts "Creationg..#{table_name}.."
    require(path)
  end
end

