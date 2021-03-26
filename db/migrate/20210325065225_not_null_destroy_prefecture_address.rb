class NotNullDestroyPrefectureAddress < ActiveRecord::Migration[6.0]
    def change
      change_column_null :addresses, :prefecture, true
    end
end
