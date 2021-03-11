class AddForeignKeyToExcreta < ActiveRecord::Migration[6.0]
  def change
    add_reference :excreta, :family, foreign_key: true
    add_reference :intake_waters, :family, foreign_key: true
    add_reference :meals, :family, foreign_key: true
    add_reference :medicines, :family, foreign_key: true
    add_reference :vitals, :family, foreign_key: true
  end
end
