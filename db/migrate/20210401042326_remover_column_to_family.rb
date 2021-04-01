class RemoverColumnToFamily < ActiveRecord::Migration[6.0]
  def change
    remove_column :families, :gender, :integer
  end
end
