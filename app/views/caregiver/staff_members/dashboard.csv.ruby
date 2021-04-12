require 'csv'

head :no_content

CSV.generate do |csv|
  csv_column_names = %w(体温　血圧(下) 血圧(上) 脈拍 呼吸回数 sp02)
  csv << csv_column_names
  @vitals.each do |vital|
    csv_column_values = [
      vital.temperature,
      vital.low_blood_pressure,
      vital.hign_blood_pressure
      vital.pulse,
      vital.breathing,
      vital.spo2
    ]
    csv << csv_column_values
  end
end
