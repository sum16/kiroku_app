class DropTableStaffMembers < ActiveRecord::Migration[6.0]
  def change
    drop_table :staff_members do |t|
      t.string "name", default: "", null: false
      t.integer "age", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["reset_password_token"], name: "index_staff_members_on_reset_password_token", unique: true
    end
  end
end
