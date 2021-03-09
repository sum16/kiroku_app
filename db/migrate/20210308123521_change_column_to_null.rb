class ChangeColumnToNull < ActiveRecord::Migration[6.0]
  def up
    change_column_null :care_recipitents, :age, true
    change_column_null :care_recipitents, :gender, true
    change_column_null :care_recipitents, :degree_of_care_required, true
    change_column_null :care_recipitents, :degree_of_support_required, true
    change_column_null :care_recipitents, :birthday, true
    change_column_null :care_recipitents, :suspend, true
    change_column_null :care_recipitents, :remarks, true
  end

  def down
    change_column_null :posts, :age, false
    change_column_null :posts, :gender, false
    change_column_null :posts, :degree_of_care_required, false
    change_column_null :posts, :degree_of_support_required, false
    change_column_null :care_recipitents, :birthday, false
    change_column_null :care_recipitents, :suspend, false
    change_column_null :care_recipitents, :remarks, false
  end
end
