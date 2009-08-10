class Platform < ActiveRecord::Base

	named_scope :all_specific, :conditions => "abbreviation <>'all'", :order => 'name ASC'

end
