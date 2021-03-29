class AddForeg < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :events, :caregivers, column: "registrant_id"
  end
end
