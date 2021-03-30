class AddReferencesToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_reference :addresses, :family, foreign_key: true
  end
end
