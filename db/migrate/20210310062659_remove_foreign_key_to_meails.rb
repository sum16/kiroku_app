class RemoveForeignKeyToMeails < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :meals, :care_recipitents
    remove_reference :meals, :care_recipitent, index: true
  end
end
