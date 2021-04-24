class CreateSupportProcessRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :support_process_records do |t|
      t.string :title
      t.string :name
      t.text :contents

      t.timestamps
    end
  end
end
