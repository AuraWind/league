class Member::EventsController < Member::MemberController
	before_filter :initialize_event_types, :only => [:new, :create]
	before_filter :initialize_venues, :only => [:new, :create]
	before_filter :initialize_states, :only => [:new, :create]
	
	def index
		@user_signups = current_user.upcoming_signups
		@user_events = current_user.upcoming_events
	end
	
	def new
		@event = Event.new
	end
	
	def create
		@event = current_user.events.new(params[:event])
		@event.venue = Venue.new(params[:venue])
		
		if @event.save
			flash[:notice] = "Event was successfully created."
			redirect_to :action => :index
		else
			logger.debug @event.to_yaml
			render :action => :new
		end
	end
	
	############### private methods ##############
	private
	
	def initialize_event_types
		@event_types = EventType.all(:order => 'name ASC')
	end
	
	def initialize_venues
		@venues = Venue.public
	end
	
	def initialize_states
		@states = State.all
	end
	
end
