class AddFamilyIdToBehaviorHistories < ActiveRecord::Migration[6.0]
  def change
    add_reference :behavior_histories, :family, foreign_key: true
  end
end
