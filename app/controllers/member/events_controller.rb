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
		@venue = params[:use_new_venue] == 'false' ? Venue.find(params[:venue_id]) : Venue.create(params[:venue])

		@event = current_user.events.new(params[:event])
		@event.venue = @venue
		
		if @event.save
			flash[:notice] = "Event was successfully created."
			redirect_to :action => :index
		else
			render :action => :new
		end
	end
	
	############### private methods ##############
	private
	
	def initialize_event_types
		@event_types = EventType.all(:order => 'name ASC')
	end
	
	def initialize_venues
		@venues = Venue.saved
	end
	
end
