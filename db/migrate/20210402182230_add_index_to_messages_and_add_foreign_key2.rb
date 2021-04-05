class AddIndexToMessagesAndAddForeignKey2 < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :messages, :caregivers
    add_foreign_key :messages, :messages, column: "root_id"
    add_foreign_key :messages, :messages, column: "parent_id"


  end
end
