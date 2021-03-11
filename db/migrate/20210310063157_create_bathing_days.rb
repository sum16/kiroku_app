class CreateBathingDays < ActiveRecord::Migration[6.0]
  def change
    create_table :bathing_days do |t|
      t.date :bathing_date, null:false
      t.boolean :judge_bath, null:false, default:false

      t.timestamps
    end
  end
end
