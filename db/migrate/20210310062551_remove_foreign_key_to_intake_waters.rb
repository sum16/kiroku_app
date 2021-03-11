class RemoveForeignKeyToIntakeWaters < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :intake_waters, :care_recipitents
    remove_reference :intake_waters, :care_recipitent, index: true
  end
end
