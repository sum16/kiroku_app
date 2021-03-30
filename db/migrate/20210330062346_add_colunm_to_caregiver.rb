class AddColunmToCaregiver < ActiveRecord::Migration[6.0]
  def change
    add_column :caregivers, :start_date, :date
    add_column :caregivers, :end_date, :date
    add_column :caregivers, :suspended, :boolean, default: false
  end
end
