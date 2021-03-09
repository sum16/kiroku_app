class AddColumnAndRemoveColumnToCaregiver < ActiveRecord::Migration[6.0]
  def change

    add_column :caregivers, :password_digest, :string

    remove_column :caregivers, :hashed_password, :string
  end
end
