class AddIndexLoginRecords < ActiveRecord::Migration[6.0]
  def change
    add_index :login_records, :created_at
    add_index :login_records, [ :caregiver_id, :created_at ]
  end
end
