class ChangeColumnToNullToCareRecipitent < ActiveRecord::Migration[6.0]
  def up
    change_column_null :care_recipitents, :family_name, true
    change_column_null :care_recipitents, :given_name, true
  end

  def down
    change_column_null :posts, :family_name, false
    change_column_null :posts, :given_name, false
  end
end
