class CreateBehaviorHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :behavior_histories do |t|
      t.references :care_recipitent, null: false, foreign_key: true
      t.date :behavior_history_date,null: false
      t.text :action_record,null: false
      t.time :behavior_time,null: false
      t.timestamps
    end
  end
end
