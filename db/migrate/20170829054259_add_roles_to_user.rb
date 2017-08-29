class AddRolesToUser < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :quality_manager_role, :boolean, default: false
  	add_column :users, :certification_role, :boolean, default: false
  	add_column :users, :quality_role, :boolean, default: false
  	add_column :users, :administration_role, :boolean, default: false

  	User.create! do |u|
        u.email     = 'qualitymanager'
        u.password    = 'qualitymanager'
        u.quality_manager_role = true
	end

	User.create! do |u|
        u.email     = 'certification'
        u.password    = 'certification'
        u.certification_role = true
	end

	User.create! do |u|
        u.email     = 'quality'
        u.password    = 'quality'
        u.quality_role = true
	end


	User.create! do |u|
        u.email     = 'administration'
        u.password    = 'administration'
        u.administration_role = true
	end
  end
end
