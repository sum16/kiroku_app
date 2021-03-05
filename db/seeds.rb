table_names = %w(caregivers care_recipitent vital intake_water medicine excretum meal medical_history behavior_history)

table_names.each do |table_name|
  path = Rails.root.join("db", "seeds", Rails.env, "#{table_name}.rb")
  if File.exist?(path)
    puts "Creationg..#{table_name}.."
    require(path)
  end
end

