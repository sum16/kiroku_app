class CreateMedicalHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :medical_histories do |t|
      t.references :care_recipitent, null: false, foreign_key: true
      t.string :past_disease
      t.string :current_disease

      t.timestamps
    end
  end
end
