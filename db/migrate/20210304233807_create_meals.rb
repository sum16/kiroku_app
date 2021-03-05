class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.references :care_recipitent, null: false, foreign_key: true
      t.boolean :breakfast, default:false, null: false
      t.boolean :lunch, default:false, null: false
      t.boolean :dinner, default:false, null: false
      t.boolean :snack, default:false, null: false

      t.timestamps
    end
  end
end
