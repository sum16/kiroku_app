class ChangeColumnToNullToCareRecipitent3 < ActiveRecord::Migration[6.0]
  def up
    change_column_null :care_recipitents, :family_name_kana, true
    change_column_null :care_recipitents, :given_name_kana, true
  end

  def down
    change_column_null :posts, :family_name_kana, false
    change_column_null :posts, :given_name_kana, false
  end
end
