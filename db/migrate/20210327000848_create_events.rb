class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :registrant_id, null:false
      t.string :title, null:false
      t.string :description
      t.datetime :application_start_time, null: false
      t.datetime :application_end_time, null: false
      t.integer :min_number_of_participants
      t.integer :max_number_of_participants

      t.timestamps
    end
  end
end
