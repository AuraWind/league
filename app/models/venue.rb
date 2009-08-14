class Venue < ActiveRecord::Base

	has_many :events
	
	belongs_to :state

	named_scope :public, :conditions => ['public = true'], :order => 'name ASC'
	named_scope :saved, :conditions => ['saved = true'], :order => 'name ASC'
	
	validates_presence_of :name
	validates_presence_of :address1
	validates_presence_of :city
	validates_presence_of :state_id
	validates_presence_of :postal_code
	
	
	################ private methods ################
	private
	
end
