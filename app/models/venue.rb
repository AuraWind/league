class Venue < ActiveRecord::Base

	has_many :events

	before_save :set_state_from_id

	named_scope :public, :conditions => ['public = true'], :order => 'name ASC'
	
	validates_presence_of :name
	validates_presence_of :address1
	validates_presence_of :city
	validates_presence_of :state
	validates_presence_of :postal_code
	
	attr_accessor :state_id
	
	
	################ private methods ################
	private
	
	def set_state_from_id
		return if state_id.blank?
		
		state = State.find(self.state_id)
		self.state = state.abbreviation
	end

end
