class CreateVitals < ActiveRecord::Migration[6.0]
  def change
    create_table :vitals do |t|
      t.references :care_recipitent, null: false, foreign_key: true
      t.date :measuring_date,null: false
      t.float :temperature,null: false
      t.integer :hign_blood_pressure,null: false
      t.integer :low_blood_pressure,null: false
      t.integer :breathing,null: false
      t.float :spo2,null: false

      t.timestamps
    end
  end
end
