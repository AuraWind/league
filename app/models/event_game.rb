class EventGame < ActiveRecord::Base
	has_many :signups, :as => :assembly

end
