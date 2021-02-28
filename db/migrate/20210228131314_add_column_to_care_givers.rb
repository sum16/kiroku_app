class AddColumnToCareGivers < ActiveRecord::Migration[6.0]
  def change
    add_column :caregivers, :hashed_password, :string, null: false
  end
end
