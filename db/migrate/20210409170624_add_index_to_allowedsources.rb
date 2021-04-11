class AddIndexToAllowedsources < ActiveRecord::Migration[6.0]
  def change
    add_index :allowed_sources,
    [ :namespace, :octet1, :octet2, :octet3, :octet4 ], unique: true, name: "index_allowed_sources_on_namespace_and_octets"
  end
end
