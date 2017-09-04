class AddWarehouseRoleToUser < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :warehouse_role, :boolean, default: false
    User.create! do |u|
      u.email     = 'warehouse'
      u.password    = 'warehouse'
      u.warehouse_role = true
    end
  end
end
