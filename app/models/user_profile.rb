class UserProfile < ActiveRecord::Base
	belongs_to :user
	belongs_to :state
	
	def location
		if self.city.present? && self.state.present?
			return self.city + ', ' + self.state.name
		elsif self.state.present?
			return self.state.name
		else
			return self.city
		end
	end
	
end
