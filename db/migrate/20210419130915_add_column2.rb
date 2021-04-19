class AddColumn2 < ActiveRecord::Migration[6.0]
  def change
    add_column :care_recipitents,  :emergency_destination, :string
    add_column :care_recipitents,  :key_person, :string
    add_column :care_recipitents,  :key_person_phone_number, :string
  end
end
