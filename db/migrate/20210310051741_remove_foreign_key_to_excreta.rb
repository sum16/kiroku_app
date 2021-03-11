class RemoveForeignKeyToExcreta < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :excreta, :care_recipitents
    remove_reference :excreta, :care_recipitent, index: true
  end
end
