class AddWarehouseRoleToUser < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :warehouse_role, :boolean, default: false
  end
end
