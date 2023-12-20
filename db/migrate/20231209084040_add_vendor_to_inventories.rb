class AddVendorToInventories < ActiveRecord::Migration[7.0]
  def change
    add_reference :inventories, :vendor, foreign_key: true
  end
end
