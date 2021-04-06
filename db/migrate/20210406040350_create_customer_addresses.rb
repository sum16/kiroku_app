class CreateCustomerAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_addresses do |t|
      t.string :address1
      t.string :address2
      t.integer :postal_code
      t.string :company_name
      t.string :prefecture
      t.string :city

      t.timestamps
    end
  end
end
