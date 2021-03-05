class RemoveColumnToFamily < ActiveRecord::Migration[6.0]
  def change
    remove_column  :families, :phone_number, :integer, limit: 4
  end
end
