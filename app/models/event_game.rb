class EventGame < ActiveRecord::Base
	has_many :signups, :as => :signupable
	has_many :users, :through => :signups
	
	belongs_to :game
	belongs_to :platform
	belongs_to :event
	
	validates_presence_of :event_id
	validates_presence_of :game_id
	validates_presence_of :platform_id
end
