class EventType < ActiveRecord::Base

	def self.gathering
		self.find(:first, :conditions => ['name = ?', 'Gathering'])
	end

	def self.tournament
		self.find(:first, :conditions => ['name = ?', 'Tournament'])
	end
	
end
