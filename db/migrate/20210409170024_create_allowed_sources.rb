class CreateAllowedSources < ActiveRecord::Migration[6.0]
  def change
    create_table :allowed_sources do |t|
      t.string :namespace, null: false
      t.integer :octet1, null: false
      t.integer :octet2, null: false
      t.integer :octet3, null: false
      t.integer :octet4, null: false
      t.boolean :wildcard, null: false, default: false

      t.timestamps
    end
  end
end
