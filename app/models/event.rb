class Event < ActiveRecord::Base
	has_many :signups, :as => :assembly
	
	named_scope :upcoming_all, lambda { {:conditions => ['start_at > ?', Time.now]} }
	named_scope :upcoming_tournaments, lambda { {:conditions => ['start_at > ? AND event_type_id = ?', Time.now, EventType.tournament.id]} }
	named_scope :upcoming_gatherings, lambda { {:conditions => ['start_at > ? AND event_type_id = ?', Time.now, EventType.gathering.id]} }
end
