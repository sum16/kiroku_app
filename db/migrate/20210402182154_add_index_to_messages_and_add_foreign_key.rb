class AddIndexToMessagesAndAddForeignKey < ActiveRecord::Migration[6.0]
  def change

    add_index :messages, [ :type, :family_id ]
    add_index :messages, [ :family_id, :discarded, :created_at ]
    add_index :messages, [ :type, :caregiver_id ]
    add_index :messages, [ :family_id, :deleted, :created_at ]
    add_index :messages, [ :family_id, :deleted, :status, :created_at ], name: "index_messages_on_c_d_s_c"
    add_index :messages, [ :root_id, :deleted, :created_at ]
    add_foreign_key :messages, :families
  end
end
