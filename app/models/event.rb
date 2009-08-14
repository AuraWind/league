class Event < ActiveRecord::Base
	has_many :signups, :as => :signupable
	has_many :users, :through => :signups
	
	belongs_to :creator, :foreign_key => :created_by, :class_name => 'User'
	belongs_to :event_type
	belongs_to :venue
	
	named_scope :upcoming_all, lambda { {:conditions => ['start_at > ?', Time.now]} }
	named_scope :upcoming_tournaments, lambda { {:conditions => ['start_at > ? AND event_type_id = ?', Time.now, EventType.tournament.id]} }
	named_scope :upcoming_gatherings, lambda { {:conditions => ['start_at > ? AND event_type_id = ?', Time.now, EventType.gathering.id]} }
	
	validates_presence_of :name
	validates_presence_of :event_type_id
	validates_presence_of :start_at
	validates_presence_of :venue_id
	validates_presence_of :created_by

	accepts_nested_attributes_for :venue
end
