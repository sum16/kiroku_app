class AddReferencesToCareRecipitent < ActiveRecord::Migration[6.0]
  def change
    add_reference :care_recipitents, :caregiver, foreign_key: true
  end
end
