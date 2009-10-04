class Member::EventGamesController < Member::MemberController

	before_filter :initialize_games
	before_filter :initialize_platforms

	def index
		@event = current_user.events.find(params[:event_id])
	end
	
	def new
		@event = current_user.events.find(params[:event_id])
		@event_game = @event.event_games.new
	end
	
	def create
		@event = current_user.events.find(params[:event_id])
		@event_game = @event.event_games.new(params[:event_game])
		
		if @event_game.save
			flash[:notice] = 'Game was successfully added to the event.'
			redirect_to :action => :index, :event_id => @event.id
		else
			render :action => :new
		end
	end
	
	def edit
		@event_game = EventGame.find(params[:id])
		@event = current_user.events.find(@event_game.event_id)
		
		flash[:error] = 'You do not have permissions to edit this event' and redirect_to :controller => '/member/events' and return if @event.blank?
	end
	
	def update
		@event_game = EventGame.find(params[:id])
		@event = current_user.events.find(@event_game.event_id)
		
		flash[:error] = 'You do not have permissions to edit this event' and redirect_to :controller => '/member/events' and return if @event.blank?
		
		@event_game.attributes = params[:event_game]
		if @event_game.save
			flash[:notice] = 'Event game was successfully updated.'
			redirect_to :action => :index, :event_id => @event.id
		else
			render :action => :edit
		end
	end
	
	def signup
		event_game = EventGame.find(params[:id])
		@signup = event_game.signups.new({:user_id =>current_user.id})
		if @signup.save
			flash[:notice] = 'You have signed up for this game.'
		else
			flash[:error] = 'Could not sign you up for this game.  Have you already signed up?'
		end
		redirect_to :controller => '/events', :action => :show, :id => event_game.event_id
	end

end
