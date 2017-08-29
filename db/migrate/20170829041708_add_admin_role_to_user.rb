class AddAdminRoleToUser < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :admin_role, :boolean, default: false
  	User.create! do |u|
        u.email     = 'adminrole'
        u.password    = 'adminrole'
        u.admin_role = true
	end
  end
end
