class ChangeColumnToFamily < ActiveRecord::Migration[6.0]
  def change
    change_column  :families, :phone_number, :integer, limit: 4
  end
end
