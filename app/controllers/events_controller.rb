class EventsController < ApplicationController
	layout 'default'

	before_filter :login_required
	
	def index
		@user_signups = current_user.upcoming_signups
	end
	
end
