class AddColumnGenderToFamily < ActiveRecord::Migration[6.0]
  def change
    add_column :families, :gender, :string
  end
end
