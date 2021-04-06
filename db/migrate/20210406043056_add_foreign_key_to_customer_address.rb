class AddForeignKeyToCustomerAddress < ActiveRecord::Migration[6.0]
  def change
    add_reference :customer_addresses, :customer, foreign_key: true
  end
end
