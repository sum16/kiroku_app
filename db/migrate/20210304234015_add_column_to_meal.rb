class AddColumnToMeal < ActiveRecord::Migration[6.0]
  def change
    add_column :meals, :meal_date, :date, null:false
  end
end
