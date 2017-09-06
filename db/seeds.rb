User.create! do |u|
    u.email     = 'warehouse'
    u.password    = 'warehouse'
    u.warehouse_role = true
end

User.create! do |u|
    u.email     = 'adminrole'
    u.password    = 'adminrole'
    u.admin_role = true
end

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