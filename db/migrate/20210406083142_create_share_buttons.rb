class CreateShareButtons < ActiveRecord::Migration[6.0]
  def change
    create_table :share_buttons do |t|
      t.references :caregiver, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
