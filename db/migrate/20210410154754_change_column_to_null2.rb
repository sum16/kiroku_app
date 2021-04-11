class ChangeColumnToNull2 < ActiveRecord::Migration[6.0]
  def up
    # Not Null制約を外す場合　not nullを外したいカラム横にtrueを記載
    change_column_null :bathing_days, :bathing_date, true
    change_column_null :behavior_histories, :behavior_history_date, true
    change_column_null :excreta, :excreta_date, true
    change_column_null :intake_waters, :drink_date, true
    change_column_null :meals, :meal_date, true
    change_column_null :medicines, :medicine_date, true
    change_column_null :vitals, :measuring_date, true
  end

  def down
    change_column_null :bathing_days, :bathing_date, false
    change_column_null :behavior_histories, :behavior_history_date, false
    change_column_null :excreta, :excreta_date, false
    change_column_null :intake_waters, :drink_date, false
    change_column_null :meals, :meal_date, false
    change_column_null :medicines, :medicine_date, false
    change_column_null :vitals, :measuring_date, false
  end
end
