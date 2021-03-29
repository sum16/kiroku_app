class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.references :event, null: false, index: false
      t.references :family, null: false
      t.boolean :approved, null:false, default: false
      t.boolean :canceled, null:false, default: false
      t.timestamps
    end
  end
end
