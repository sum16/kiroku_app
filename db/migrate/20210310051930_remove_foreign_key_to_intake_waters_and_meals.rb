class RemoveForeignKeyToIntakeWatersAndMeals < ActiveRecord::Migration[6.0]
  def change
    def change
      remove_foreign_key :intake_waters, :care_recipitents
      remove_reference :intake_waters, :care_recipitent, index: true
    end

    def change
      remove_foreign_key :meals, :care_recipitents
      remove_reference :meals, :care_recipitent, index: true
    end
  end

end
