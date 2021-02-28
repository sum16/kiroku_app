class CreateCaregivers < ActiveRecord::Migration[6.0]
  def change
    create_table :caregivers do |t|
      t.string :name, null:false
      t.integer :age, null:false

      t.timestamps
    end
  end
end
