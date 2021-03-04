class CreateIntakeWaters < ActiveRecord::Migration[6.0]
  def change
    create_table :intake_waters do |t|
      t.date :drink_date, null:false
      t.integer :amount_of_water, null:false
      t.references :care_recipitent, foreign_key: true

      t.timestamps
    end
  end
end
