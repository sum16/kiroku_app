class AddColumnToCareRecipitent2 < ActiveRecord::Migration[6.0]
  def change
    add_column :care_recipitents, :past_disease, :text 
    add_column :care_recipitents, :current_disease, :text 
  end
end
