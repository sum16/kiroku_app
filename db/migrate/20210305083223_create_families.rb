class CreateFamilies < ActiveRecord::Migration[6.0]
  def change
    create_table :families do |t|
      t.references :care_recipitent, null: false, foreign_key: true
      t.string :family_name, null: false
      t.string :given_name, null: false
      t.string :family_name_kana, null: false
      t.string :given_name_kana, null: false
      t.string :address, null: false
      t.integer :phone_number, null: false
      t.integer :gender, null: false

      t.timestamps
    end
  end
end
