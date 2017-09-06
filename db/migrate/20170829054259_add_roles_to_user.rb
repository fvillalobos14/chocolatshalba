class AddRolesToUser < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :quality_manager_role, :boolean, default: false
  	add_column :users, :certification_role, :boolean, default: false
  	add_column :users, :quality_role, :boolean, default: false
  	add_column :users, :administration_role, :boolean, default: false
  end
end
