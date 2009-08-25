class Member::EventsController < Member::MemberController
	before_filter :initialize_event_types, :only => [:new, :create, :edit, :update]
	before_filter :initialize_venues, :only => [:new, :create, :edit, :update]
	before_filter :initialize_states, :only => [:new, :create, :edit, :update]
	
	def index
		@user_signups = current_user.upcoming_signups
		@user_events = current_user.upcoming_events
	end
	
	def new
		@event = Event.new
	end
	
	def create
		@venue = params[:use_new_venue] == 'false' ? Venue.find(params[:event][:venue_id]) : Venue.create(params[:venue])

		@event = current_user.events.new(params[:event])
		@event.venue = @venue
		
		if @event.save
			flash[:notice] = "Event was successfully created."
			redirect_to :action => :index
		else
			render :action => :new
		end
	end
	
	def edit
		@event = current_user.events.find(params[:id])
		@venue = @event.venue
	end
	
	def update
		@venue = params[:use_new_venue] == 'false' ? Venue.find(params[:event][:venue_id]) : Venue.create(params[:venue])

		@event = Event.find(params[:id])
		@event.attributes = params[:event]
		@event.venue = @venue
		
		if @event.save
			flash[:notice] = "Event was successfully updated."
			redirect_to :action => :index
		else
			render :action => :edit
		end
	end
	
	def signup
		event = Event.upcoming_all.find(params[:id])
		if event.blank?
			flash[:error] = 'Sorry, you can not sign up for this event.'
		else
			@signup = event.signups.new({:user_id =>current_user.id})
			if @signup.save
				flash[:notice] = 'You have signed up for this event.'
			else
				flash[:error] = 'Could not sign you up for this event.  Have you already signed up?'
			end
		end
		redirect_to :controller => '/events', :action => :show, :id => event.id
	end
	
	def attendance
		@event = Event.find(params[:id])
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
