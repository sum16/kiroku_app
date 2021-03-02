class CreateCareRecipitents < ActiveRecord::Migration[6.0]
  def change
    create_table :care_recipitents do |t|
      t.string :family_name, null:false
      t.string :given_name, null:false
      t.string :family_name_kana, null:false
      t.string :given_name_kana, null:false
      t.integer :age, null:false
      t.integer :gender, null:false
      t.integer :degree_of_care_required, null:false
      t.integer :degree_of_support_required, null:false
      t.date :birthday, null:false
      t.text :remarks
      t.boolean :suspend, null:false, default: false

      t.timestamps
     
    end
  end
end
