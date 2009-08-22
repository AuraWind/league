class Platform < ActiveRecord::Base

	named_scope :all_specific, :conditions => "abbreviation <>'all'", :order => 'name ASC'

	validates_presence_of :name
	validates_presence_of :abbreviation
	
end
