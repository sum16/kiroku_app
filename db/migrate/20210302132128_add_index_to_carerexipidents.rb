class AddIndexToCarerexipidents < ActiveRecord::Migration[6.0]
  def change
    add_index :care_recipitents, [ :family_name_kana, :given_name_kana ]
  end
end
