class UserProfile < ActiveRecord::Base
	belongs_to :user
	
	def location
		if self.city.present? && self.state.present?
			return self.city + ', ' + self.state
		elsif self.city.present?
			return self.city
		else
			return self.state
		end
	end
	
end
