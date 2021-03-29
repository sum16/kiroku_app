class AddColunToFamilies < ActiveRecord::Migration[6.0]
  def change
    add_column :families, :password_digest, :string
  end
end
