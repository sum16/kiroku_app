class AddReferencesToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :caregiver, foreign_key: true
  end
end
