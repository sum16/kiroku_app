class AddColumnToFamily < ActiveRecord::Migration[6.0]
  def change
    add_column :families, :relationship, :string, null: false, default: ''
  end
end
