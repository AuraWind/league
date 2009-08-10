class EventsController < ApplicationController
	layout 'default'

	before_filter :login_required
	
	def index
		@user_events = current_user.upcoming_events
	end
	
end
