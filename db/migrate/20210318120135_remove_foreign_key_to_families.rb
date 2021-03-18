class RemoveForeignKeyToFamilies < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :families, :care_recipitents
    remove_reference :families, :care_recipitent, index: true
  end
end
