class AddColomnToCarerecipitent2 < ActiveRecord::Migration[6.0]
  def change
    remove_column :care_recipitents, :gender, :integer

    add_column :care_recipitents, :gender, :string
  end
end
