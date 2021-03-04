class CreateMedicines < ActiveRecord::Migration[6.0]
  def change
    create_table :medicines do |t|
      t.references :care_recipitent, null: false, foreign_key: true
      t.date :medicine_date, null: false
      t.boolean :check_before_breakfast, default:false, null: false
      t.boolean :check_before_lunch, default:false, null: false
      t.boolean :check_after_lunch, default:false, null: false
      t.boolean :check_before_dinner, default:false, null: false
      t.boolean :check_after_dinner, default:false, null: false
      t.boolean :check_ointment, default:false, null: false
      t.boolean :check_eye_drops, default:false, null: false

      t.timestamps
    end
  end
end
