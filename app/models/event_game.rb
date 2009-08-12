class EventGame < ActiveRecord::Base
	has_many :signups, :as => :signupable

end
