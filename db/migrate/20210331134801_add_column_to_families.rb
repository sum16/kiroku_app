class AddColumnToFamilies < ActiveRecord::Migration[6.0]
  def change
    add_column :families, :care_recipitent_name, :string
  end
end
