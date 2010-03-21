class Role < ActiveRecord::Base
	
	def self.default
		self.find :first, :conditions => ['is_default = ?', true]
	end
	
	def self.access_level(role_name)
		role = self.find_by_name(role_name)
		role ? role.access_level : 0
	end
end
