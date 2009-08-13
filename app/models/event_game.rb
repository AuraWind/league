class EventGame < ActiveRecord::Base
	has_many :signups, :as => :signupable
	has_many :users, :through => :signups
end
