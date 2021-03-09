class RemoveForeignKeyToBehaviorHistories < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :behavior_histories, :care_recipitents
    remove_reference :behavior_histories, :care_recipitent, index: true
  end
end
