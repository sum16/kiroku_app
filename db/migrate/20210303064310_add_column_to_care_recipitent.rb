class AddColumnToCareRecipitent < ActiveRecord::Migration[6.0]
  def change
    add_column :vitals, :pulse, :integer, null: false
  end
end
