class CreateExcreta < ActiveRecord::Migration[6.0]
  def change
    create_table :excreta do |t|
      t.references :care_recipitent, null: false, foreign_key: true
      t.date :excreta_date, null: false
      t.boolean :judge_shit, default:false, null: false
      t.boolean :judge_pee, default:false, null: false

      t.timestamps
    end
  end
end
